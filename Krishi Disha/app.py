from flask import Flask, render_template, request, redirect, url_for, session, flash, jsonify
from flask_mysqldb import MySQL
from werkzeug.security import generate_password_hash, check_password_hash
import re
import socket
from flask_mail import Mail, Message
from MySQLdb.cursors import DictCursor
import json
import threading
import time
import os
import json
from datetime import datetime, timedelta
try:
    import firebase_admin
    from create_tables import create_tables
    from firebase_admin import credentials, db as firebase_db
except Exception:
    firebase_admin = None



app = Flask(__name__)
app.secret_key = os.environ.get('SECRET_KEY', 'supersecret')  # Needed for sessions

# ---------------- DB CONFIG ----------------
app.config['MYSQL_HOST'] = os.environ.get('MYSQL_HOST', 'localhost')
app.config['MYSQL_USER'] = os.environ.get('MYSQL_USER', 'root')
app.config['MYSQL_PASSWORD'] = os.environ.get('MYSQL_PASSWORD', 'sahan@135')
app.config['MYSQL_DB'] = os.environ.get('MYSQL_DB', 'krishidisha')
app.config['MYSQL_PORT'] = int(os.environ.get('MYSQL_PORT', 3306))
mysql = MySQL(app)

# ---------------- MAIL CONFIG ----------------
app.config['MAIL_SERVER'] = 'smtp.gmail.com'
app.config['MAIL_PORT'] = 465
app.config['MAIL_USE_SSL'] = True     # Use SSL instead of TLS
app.config['MAIL_USE_TLS'] = False    # Disable TLS
app.config['MAIL_USERNAME'] = 'krishidisha453@gmail.com'
app.config['MAIL_PASSWORD'] = 'sbsa eeat hhre chdf'  # The same one you used in test

# Ensure Mail is initialized (used by sensor email sending)
mail = Mail(app)

# ---------------- FOLLOW-UP EMAIL FUNCTION ----------------
def send_followup_email(email, lang, sensor_data):
    """Send a beautiful follow-up email 2 minutes after initial recommendation"""
    def delayed_email():
        print(f"[{time.strftime('%H:%M:%S')}] Follow-up email thread started for {email}. Waiting 2 minutes...")
        time.sleep(120)  # Wait 2 minutes (120 seconds)
        print(f"[{time.strftime('%H:%M:%S')}] 2 minutes elapsed. Attempting to send follow-up email to {email}")

        # Re-fetch the latest sensor data at send-time so the follow-up contains freshest values
        try:
            latest_sensor, err = get_firebase_latest_sensor()
            if latest_sensor:
                current_sensor = latest_sensor
                print(f"[{time.strftime('%H:%M:%S')}] [DEBUG] Re-fetched latest sensor data from Firebase for {email}: {current_sensor}")
            else:
                current_sensor = sensor_data or {}
                print(f"[{time.strftime('%H:%M:%S')}] [DEBUG] Could not fetch latest from Firebase, falling back to scheduled sensor_data: {current_sensor}")
        except Exception as _e:
            current_sensor = sensor_data or {}
            print(f"[{time.strftime('%H:%M:%S')}] [DEBUG] Exception while fetching latest sensor: {_e}. Using passed sensor_data: {current_sensor}")
        
        # Create a new application context for the thread
        with app.app_context():
            try:
                if lang == 'kn':
                    subject = "ಮಣ್ಣು ಪರಿಶೀಲನೆ - ಕೃಷಿ ದಿಶಾ ನೆನಪಿಸಿಕೆ"
                    body = f"""ನಮಸ್ಕಾರ!

ಕೃಷಿ ದಿಶಾದಿಂದ ಹಗುರವಾದ ನೆನಪಿಸಿಕೆ:

ಇದು ಸುಮಾರು 6 ತಿಂಗಳ ಹಿಂದೆ ನೀವು ನಿಮ್ಮ ಮಣ್ಣಿನ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿದ್ದೀರಿ. ಮಣ್ಣು ಕಾಲಾನಂತರದಲ್ಲಿ ಬದಲಾಗಬಹುದು, ಆದ್ದರಿಂದ ದಯವಿಟ್ಟು ಈಗ ನಿಮ್ಮ ಮಣ್ಣನ್ನು ಮರುಪರಿಶೀಲಿಸಿ.

ಇತ್ತೀಚಿನ ಲಭ್ಯವಿರುವ ಮಣ್ಣಿನ ಓದುಗಳು (ಯಾವಾಗಲಾದರೂ ಲಭ್ಯವಿದ್ದಿವೆಯೇ):
• ನೈಟ್ರೋಜನ್ (N): {current_sensor.get('N', 0)}
• ಫಾಸ್ಫರಸ್ (P): {current_sensor.get('P', 0)}
• ಪೊಟ್ಯಾಸಿಯಮ್ (K): {current_sensor.get('K', 0)}
• ಮಣ್ಣಿನ pH: {current_sensor.get('ph', 0)}
• ಮಣ್ಣಿನ ತೇವಾಂಶ: {current_sensor.get('moisture', 0)}%

ದಯವಿಟ್ಟು ನಮ್ಮ ಸೆನ್ಸಾರ್ ಸೇವೆಯನ್ನು ಬಳಸಿ ಅಥವಾ ವೆಬ್‌ಸೈಟ್‌ಗೆ ಭೇಟಿ ನೀಡಿ ಮತ್ತು ನಿಮ್ಮ ಮಣ್ಣಿನ ಪ್ರಸ್ತುತ ಸ್ಥಿತಿಯನ್ನು ನಮಗೆ ತಿಳಿಸಿ.

ಧನ್ಯವಾದಗಳು,
ಕೃಷಿ ದಿಶಾ ತಂಡ"""
                else:
                    subject = "Soil Check Reminder - Krishi Disha"
                    body = f"""Dear Farmer,

A gentle reminder from Krishi Disha:

It has been about 6 months since you last checked your soil condition. Soil changes over time, and to keep your crops healthy and productive, please check your soil again.

Latest available soil readings:
• Nitrogen (N): {current_sensor.get('N', 0)}
• Phosphorus (P): {current_sensor.get('P', 0)}
• Potassium (K): {current_sensor.get('K', 0)}
• Soil pH: {current_sensor.get('ph', 0)}
• Soil Moisture: {current_sensor.get('moisture', 0)}%

Please use our sensor facility or visit our website for a complete soil analysis.

Thank you for trusting Krishi Disha with your farming journey.

Best regards,
Krishi Disha Team"""

                msg = Message(subject=subject,
                              sender=app.config['MAIL_USERNAME'],
                              recipients=[email],
                              body=body)
                mail.send(msg)
                print(f"[{time.strftime('%H:%M:%S')}] [SUCCESS] Follow-up email sent successfully to {email}")
            except Exception as e:
                print(f"[{time.strftime('%H:%M:%S')}] [ERROR] Failed to send follow-up email to {email}: {e}")
                import traceback
                traceback.print_exc()

    # Start the delayed email in a separate thread
    thread = threading.Thread(target=delayed_email, name=f"FollowupEmail-{email}")
    thread.daemon = False  # Explicitly set to False
    thread.start()
    print(f"[{time.strftime('%H:%M:%S')}] Follow-up email thread created for {email} (Thread ID: {thread.ident})")
    
    # Backup: Also save to file for reliability
    schedule_file = "followup_emails.json"
    try:
        if os.path.exists(schedule_file):
            with open(schedule_file, 'r') as f:
                scheduled_emails = json.load(f)
        else:
            scheduled_emails = []
        
        scheduled_emails.append({
            'email': email,
            'lang': lang,
            'sensor_data': sensor_data,
            'scheduled_time': (datetime.now() + timedelta(minutes=2)).isoformat(),
            'created_at': datetime.now().isoformat()
        })
        
        with open(schedule_file, 'w') as f:
            json.dump(scheduled_emails, f, indent=2)
        
        print(f"[{time.strftime('%H:%M:%S')}] Backup schedule saved to file for {email}")
    except Exception as e:
        print(f"[{time.strftime('%H:%M:%S')}] Failed to save backup schedule: {e}")

def process_scheduled_emails():
    """Process scheduled follow-up emails from file"""
    schedule_file = "followup_emails.json"
    if not os.path.exists(schedule_file):
        return
    
    try:
        with open(schedule_file, 'r') as f:
            scheduled_emails = json.load(f)
        
        current_time = datetime.now()
        emails_to_send = []
        remaining_emails = []
        
        for email_data in scheduled_emails:
            scheduled_time = datetime.fromisoformat(email_data['scheduled_time'])
            if current_time >= scheduled_time:
                emails_to_send.append(email_data)
            else:
                remaining_emails.append(email_data)
        
        # Send emails that are due
        for email_data in emails_to_send:
            try:
                with app.app_context():
                    if email_data['lang'] == 'kn':
                        subject = "ಮಣ್ಣು ಪರಿಶೀಲನೆ - ಕೃಷಿ ದಿಶಾ ನೆನಪಿಸಿಕೆ"
                        body = f"""ನಮಸ್ಕಾರ!

ಕೃಷಿ ದಿಶಾದಿಂದ ನಿಮಗೆ ಒಂದು ಮುಖ್ಯ ನೆನಪಿಸಿಕೆ:

ಇದು 6 ತಿಂಗಳ ಹಿಂದೆ ನೀವು ನಿಮ್ಮ ಮಣ್ಣಿನ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿದ್ದೀರಿ. ಮಣ್ಣು ಒಂದು ಜೀವಂತ ವ್ಯವಸ್ಥೆಯಾಗಿದೆ ಮತ್ತು ಕಾಲಾನಂತರದಲ್ಲಿ ಬದಲಾಗುತ್ತದೆ.

ಇತ್ತೀಚಿನ ಮಣ್ಣು ಪಠ್ಯಗಳು:
• ನೈಟ್ರೋಜನ್ (N): {email_data['sensor_data']['N']}
• ಫಾಸ್ಫರಸ್ (P): {email_data['sensor_data']['P']}  
• ಪೊಟ್ಯಾಸಿಯಮ್ (K): {email_data['sensor_data']['K']}
• ಮಣ್ಣಿನ ಆಮ್ಲತೆ (pH): {email_data['sensor_data']['ph']}
• ಮಣ್ಣಿನ ತೇವಾಂಶ (Moisture): {email_data['sensor_data'].get('moisture', 0)}%

ಧನ್ಯವಾದಗಳು!
ಕೃಷಿ ದಿಶಾ ತಂಡ"""
                    else:
                        subject = "Soil Check Reminder - Krishi Disha"
                        body = f"""Dear Farmer,

A gentle reminder from Krishi Disha:

It has been 6 months since you last checked your soil condition. Soil is a living system that changes over time.

Your recent soil readings were:
• Nitrogen (N): {email_data['sensor_data']['N']}
• Phosphorus (P): {email_data['sensor_data']['P']}
• Potassium (K): {email_data['sensor_data']['K']}
• Soil pH: {email_data['sensor_data']['ph']}
• Soil Moisture: {email_data['sensor_data'].get('moisture', 0)}%

Thank you for trusting Krishi Disha with your farming journey!

Best regards,
Krishi Disha Team"""

                    msg = Message(subject=subject,
                                  sender=app.config['MAIL_USERNAME'],
                                  recipients=[email_data['email']],
                                  body=body)
                    mail.send(msg)
                    print(f"[{time.strftime('%H:%M:%S')}] [FILE-SCHEDULER] Follow-up email sent to {email_data['email']}")
            except Exception as e:
                print(f"[{time.strftime('%H:%M:%S')}] [FILE-SCHEDULER] Failed to send email to {email_data['email']}: {e}")
        
        # Update the file with remaining emails
        with open(schedule_file, 'w') as f:
            json.dump(remaining_emails, f, indent=2)
            
    except Exception as e:
        print(f"[{time.strftime('%H:%M:%S')}] Error processing scheduled emails: {e}")

# ---------------- FIREBASE (optional) ----------------
def init_firebase_if_possible():
    if firebase_admin is None:
        return False
    if firebase_admin._apps:
        return True
    try:
        with open('firebase.json', 'r') as f:
            cfg = json.load(f)
        project_id = (cfg.get('project_id') or '').strip()
        cred = credentials.Certificate(cfg)
        # Try common RTDB URL patterns
        candidate_urls = []
        if project_id:
            candidate_urls = [
                f"https://{project_id}-default-rtdb.firebaseio.com",
                f"https://{project_id}.firebaseio.com"
            ]
        # Fallback: initialize without DB if project_id unknown
        if not candidate_urls:
            firebase_admin.initialize_app(cred)
            return True
        last_error = None
        for url in candidate_urls:
            try:
                firebase_admin.initialize_app(cred, {"databaseURL": url})
                return True
            except Exception as e:
                last_error = e
                continue
        if last_error:
            print("Firebase init failed:", last_error)
        return False
    except Exception as e:
        print("Firebase config/load failed:", e)
        return False

def get_firebase_latest_sensor():
    try:
        if not init_firebase_if_possible():
            return None, 'firebase_not_initialized'
            # We'll try several strategies to fetch the latest reading because
            # Firebase RTDB schemas vary between projects (push IDs, numeric keys,
            # or child properties like 'timestamp'). Try common ordering fields
            # first and fall back to scanning entries.
        tried_nodes = ['sensor_data', 'soil', 'readings']
        timestamp_fields = ['timestamp', 'time', 'ts', 'created_at', 'createdAt']

        def _extract_first_from_snap(snap):
            if not snap:
                return None
            if isinstance(snap, dict):
                # If it's a dict of key->entry, return the single value when limited
                vals = list(snap.values())
                return vals[0] if vals else None
            # For other shapes, return as-is
            return snap

        latest = None
        last_method = None

        for node in tried_nodes:
            try:
                ref = firebase_db.reference(node)
                # Try ordering by common timestamp fields first
                for tf in timestamp_fields:
                    try:
                        snap = ref.order_by_child(tf).limit_to_last(1).get()
                        entry = _extract_first_from_snap(snap)
                        if entry:
                            latest = entry
                            last_method = f"{node}.order_by_child({tf})"
                            break
                    except Exception as e:
                        # ordering by this child may not be supported for this node
                        print(f"Firebase: order_by_child({tf}) failed for {node}: {e}")
                        continue
                if latest:
                    break

                # Try ordering by key (works if keys are push-ids or numeric timestamps)
                try:
                    snap = ref.order_by_key().limit_to_last(1).get()
                    entry = _extract_first_from_snap(snap)
                    if entry:
                        latest = entry
                        last_method = f"{node}.order_by_key()"
                        break
                except Exception as e:
                    print(f"Firebase: order_by_key failed for {node}: {e}")

                # Fallback: fetch all and pick the newest by inspecting timestamp fields
                try:
                    all_data = ref.get() or {}
                    if isinstance(all_data, dict) and all_data:
                        # Try to find the entry with the max timestamp-like field
                        best = None
                        best_ts = None
                        for k, v in all_data.items():
                            # Look for a numeric timestamp in known fields
                            candidate_ts = None
                            if isinstance(v, dict):
                                for tf in timestamp_fields:
                                    if tf in v:
                                        try:
                                            candidate_ts = float(v[tf])
                                            break
                                        except Exception:
                                            pass
                            # If keys are numeric, use them
                            try:
                                key_num = float(k)
                                if candidate_ts is None:
                                    candidate_ts = key_num
                            except Exception:
                                pass

                            if candidate_ts is not None:
                                if best_ts is None or candidate_ts > best_ts:
                                    best_ts = candidate_ts
                                    best = v

                        if best is not None:
                            latest = best
                            last_method = f"{node}.scanned_by_timestamp"
                            break
                        # If we couldn't find by timestamp, pick the last sorted key
                        try:
                            last_key = sorted(all_data.keys())[-1]
                            latest = all_data[last_key]
                            last_method = f"{node}.last_sorted_key"
                            break
                        except Exception:
                            pass
                except Exception as e:
                    print(f"Firebase: fallback get() failed for {node}: {e}")
                    continue
            except Exception as e:
                print(f"Firebase: could not reference node {node}: {e}")
                continue

        if not latest:
            print("Firebase: no latest entry found in nodes tried")
            return None, 'no_data'

        # Map fields to sensor dict with safe conversions
        try:
            sensor = {
                'N': float(latest.get('nitrogen', latest.get('N', 0) if isinstance(latest, dict) else 0)),
                'P': float(latest.get('phosphorus', latest.get('phosphorous', latest.get('P', 0)))),
                'K': float(latest.get('potassium', latest.get('K', 0))),
                'moisture': float(latest.get('soilMoisture', latest.get('moisture', 0))),
                'temp': float(latest.get('temperature', latest.get('temp', 0))),
                'ph': float(latest.get('ph', 7)),
            }
            print(f"Firebase: selected latest entry using {last_method}: {sensor}")
            return sensor, None
        except Exception as e:
            print(f"Firebase: failed to parse latest entry into sensor dict: {e}")
            return None, 'parse_error'

    except Exception as e:
        print('Firebase read failed:', e)
        return None, str(e)



# ---------------- TRANSLATIONS ----------------
TRANSLATIONS = {
    "en": {
        "home": "Home",
        "crops": "Crops",
        "fertilizers": "Fertilizers",
        "guide": "Step-by-Step Guide",
        "sensor":"Sensor",
        "hero_title": "Krishi Disha",
        "hero_subtitle": "Empowering farmers with simple, beginner-friendly guidance on what to grow, when to grow, and how to care for crops. This portal helps you make informed decisions for your farm.",
        "crops_card_title": "🌾 Crops",
        "crops_card_desc": "Seasons, duration, sowing window, and basic care.",
        "crops_card_link": "View crops \u2192",
        "fert_card_title": "🧪 Fertilizers",
        "fert_card_desc": "When to use Urea, DAP, MOP, Lime, and compost.",
        "fert_card_link": "View fertilizers \u2192",
        "guide_card_title": "🧭 Step-by-step",
        "guide_card_desc": "Answer a few questions to get crop suggestions.",
        "guide_card_link": "Try the guide \u2192",
        "sensor_card_title": "📡 Smart Sensor",
        "sensor_card_desc": "Get live soil data (N, P, K, Moisture, Temp, pH) and recommendations.",
        "sensor_card_link": "Check now \u2192",
        "footer": '"Soil is our life, Farmer is our hope."',
        "search_placeholder": "Search crop (e.g., rice, tomato)",
        "search_btn": "Search",
        "step_title": "Step-by-Step Crop Guide",
        "suggested_crops": "Suggested Crops",
        "back_to_list": "Back to list",
        "back_to_crops": "← Back to crops",
        "season": "Season",
        "irrigation": "Irrigation",
        "duration": "Duration",
        "soil_ph": "Soil pH",
        "sowing_window": "Sowing Window",
        "harvest_window": "Harvest Window",
        "fertilizer": "Fertilizer",
        "result_hint": "Try relaxing filters or adjusting pH range.",
        "climate": "Climate",
        "soil": "Soil",
        "seed_rate": "Seed rate",
        "spacing": "Spacing",
        "yield": "Yield",
        "crops_subtitle": "Explore crops by season, duration and more",
        "fertilizers_subtitle": "Recommended usage, timing, and placement for common fertilizers",
        "guide_subtitle": "Answer a few questions to get personalized crop suggestions"
    },
    "kn": {
        "home": "ಮನೆ",
        "crops": "ಬೆಳೆಗಳು",
        "fertilizers": "ರಸಗೊಬ್ಬರಗಳು",
        "guide": "ಹಂತ ಹಂತವಾಗಿ ಮಾರ್ಗದರ್ಶಿ",
        "sensor":"ಸೆನ್ಸಾರ್",
        "hero_title": "ಕೃಷಿ ದಿಶಾ",
        "hero_subtitle": "ಬೆಳೆ ಏನು ಬೆಳೆಸಬೇಕು, ಯಾವಾಗ ಬೆಳೆಸಬೇಕು, ಹೇಗೆ ಆರೈಕೆ ಮಾಡಬೇಕು ಎಂಬುದರ ಬಗ್ಗೆ ಸರಳ ಮತ್ತು ಸುಲಭ ಮಾರ್ಗದರ್ಶನವನ್ನು ನೀಡುವ ವೇದಿಕೆ. ನಿಮ್ಮ ಕೃಷಿಗಾಗಿ ತಿಳಿದ ನಿರ್ಧಾರಗಳನ್ನು ತೆಗೆದುಕೊಳ್ಳಲು ಇದು ಸಹಾಯ ಮಾಡುತ್ತದೆ.",
        "crops_card_title": "🌾 ಬೆಳೆಗಳು",
        "crops_card_desc": "ಋತುಗಳು, ಅವಧಿ, ಬಿತ್ತನೆ ಸಮಯ ಮತ್ತು ಮೂಲ ಆರೈಕೆ.",
        "crops_card_link": "ಬೆಳೆಗಳನ್ನು ನೋಡಿ \u2192",
        "fert_card_title": "🧪 ರಸಗೊಬ್ಬರಗಳು",
        "fert_card_desc": "ಯೂರಿಯಾ, ಡಿಎಪಿ, ಎಂಒಪಿ, ಸುಣ್ಣ ಮತ್ತು ಕಂಪೋಸ್ಟ್ ಬಳಸುವ ಸಮಯ.",
        "fert_card_link": "ರಸಗೊಬ್ಬರಗಳನ್ನು ನೋಡಿ \u2192",
        "guide_card_title": "🧭 ಹಂತ ಹಂತವಾಗಿ",
        "guide_card_desc": "ಕೆಲವು ಪ್ರಶ್ನೆಗಳಿಗೆ ಉತ್ತರಿಸಿ ಬೆಳೆ ಸಲಹೆಗಳನ್ನು ಪಡೆಯಿರಿ.",
        "guide_card_link": "ಮಾರ್ಗದರ್ಶಿ ಪ್ರಯತ್ನಿಸಿ \u2192",
        "sensor_card_title": "📡 ಸ್ಮಾರ್ಟ್ ಸೆನ್ಸಾರ್",
        "sensor_card_desc": "ತಾಜಾ ಮಣ್ಣಿನ ದತ್ತಾಂಶ (N, P, K, ತೇವಾಂಶ, ತಾಪಮಾನ, pH) ಮತ್ತು ಶಿಫಾರಸುಗಳು.",
        "sensor_card_link": "ಈಗ ಪರಿಶೀಲಿಸಿ \u2192",
        "footer": '"ಮಣ್ಣೇ ನಮ್ಮ ಜೀವ, ರೈತನೇ ನಮ್ಮ ನಂಬಿಕೆ."',
        "search_placeholder": "ಬೆಳೆ ಹುಡುಕಿ (ಉದಾ: ಅಕ್ಕಿ, ಟೊಮೇಟೊ)",
        "search_btn": "ಹುಡಕಿ",
        "step_title": "ಹಂತ ಹಂತವಾಗಿ ಬೆಳೆ ಮಾರ್ಗದರ್ಶಿ",
        "suggested_crops": "ಸೂಚಿಸಲಾದ ಬೆಳೆಗಳು",
        "back_to_list": "ಪಟ್ಟಿಗೆ ಹಿಂತಿರುಗಿ",
        "back_to_crops": "← ಬೆಳೆಗಳಿಗೆ ಹಿಂತಿರುಗಿ",
        "season": "ಕಾಲ",
        "irrigation": "ನೀರಾವರಿ",
        "duration": "ಅವಧಿ",
        "soil_ph": "ಮಣ್ಣಿನ ಪಿಹೆಚ್",
        "sowing_window": "ಬಿತ್ತನೆ ಸಮಯ",
        "harvest_window": "ಕಟಾವು ಸಮಯ",
        "fertilizer": "ರಸಗೊಬ್ಬರ",
        "result_hint": "ಸೂಚನೆ: ಫಿಲ್ಟರ್‌ಗಳನ್ನು ಸಡಿಲಿಸಿ ಅಥವಾ ಪಿಹೆಚ್ ಶ್ರೇಣಿಯನ್ನು ಹೊಂದಿಸಿ.",
        "climate": "ಹವಾಮಾನ",
        "soil": "ಮಣ್ಣು",
        "seed_rate": "ಬೀಜದ ಪ್ರಮಾಣ",
        "spacing": "ಅಂತರ",
        "yield": "ಉತ್ಪಾದನೆ",
        "crops_subtitle": "ಋತು, ಅವಧಿ ಮತ್ತು ಇನ್ನಷ್ಟು ಮೂಲಕ ಬೆಳೆಗಳನ್ನು ಅನ್ವೇಷಿಸಿ",
        "fertilizers_subtitle": "ಸಾಮಾನ್ಯ ರಸಗೊಬ್ಬರಗಳಿಗೆ ಶಿಫಾರಸು ಮಾಡಲಾದ ಬಳಕೆ, ಸಮಯ ಮತ್ತು ಸ್ಥಳ",
        "guide_subtitle": "ವೈಯಕ್ತಿಕ ಬೆಳೆ ಸಲಹೆಗಳನ್ನು ಪಡೆಯಲು ಕೆಲವು ಪ್ರಶ್ನೆಗಳಿಗೆ ಉತ್ತರಿಸಿ"
    }
}

# ---------------- AUTH ----------------
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = generate_password_hash(request.form['password'])
        email = request.form['email']
        fullname = request.form['fullname']
        # Validate email format
        email_pattern = r"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"
        if not re.match(email_pattern, email or ""):
            flash("Please enter a valid email address.", "error")
            return redirect(url_for('register'))
        # Block common disposable/fake domains and require resolvable domain
        try:
            local_part, domain = (email or '').rsplit('@', 1)
        except ValueError:
            flash("Please enter a valid email address.", "error")
            return redirect(url_for('register'))

        disposable_domains = {
            'mailinator.com','10minutemail.com','tempmail.com','tempmail.net','temp-mail.org',
            'guerrillamail.com','sharklasers.com','yopmail.com','fakeinbox.com','trashmail.com',
            'example.com','test.com','example.org','example.net'
        }
        if domain.lower() in disposable_domains:
            flash("Please use a real email address (disposable domains are not allowed).", "error")
            return redirect(url_for('register'))

        # Require domain to resolve via DNS (A/AAAA); best-effort check
        try:
            socket.getaddrinfo(domain, None)
        except Exception:
            flash("Email domain is not reachable. Please use a valid email domain.", "error")
            return redirect(url_for('register'))
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM users WHERE username=%s", (username,))
        existing = cur.fetchone()
        if existing:
            flash("Username already exists", "error")
            cur.close()
            return redirect(url_for('register'))
        # Check duplicate email
        cur.execute("SELECT id FROM users WHERE email=%s", (email,))
        email_exists = cur.fetchone()
        if email_exists:
            flash("Email already registered", "error")
            cur.close()
            return redirect(url_for('register'))
        cur.execute("INSERT INTO users (username, password, email, fullname) VALUES (%s, %s, %s, %s)",
                    (username, password, email, fullname))
        mysql.connection.commit()
        cur.close()
        flash("Registration successful! Please log in.", "success")
        return redirect(url_for('login'))
    return render_template('register.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        cur = mysql.connection.cursor()
        # If the input looks like an email, validate and search by email
        if '@' in (username or ''):
            email_pattern = r"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"
            if not re.match(email_pattern, username):
                flash("Please enter a valid email address.", "error")
                cur.close()
                return redirect(url_for('login'))
            cur.execute("SELECT * FROM users WHERE email=%s", (username,))
        else:
            cur.execute("SELECT * FROM users WHERE username=%s", (username,))
        user = cur.fetchone()
        cur.close()
        if user and check_password_hash(user[2], password):
            session['user_id'] = user[0]
            session['username'] = user[1]
            return redirect(url_for('home'))
        flash("Invalid credentials", "error")
        return redirect(url_for('login'))
    return render_template('login.html')

@app.route('/logout')
def logout():
    session.clear()
    flash("You have been logged out.", "info")
    return redirect(url_for('login'))

# ---------------- ADMIN AUTH ----------------
@app.route('/admin/login', methods=['GET', 'POST'])
def admin_login():
    if request.method == 'POST':
        username = (request.form.get('username') or '').strip()
        password = (request.form.get('password') or '').strip()
        if username == 'krishi disha' and password == 'krishi disha@123':
            session['is_admin'] = True
            session['user_id'] = 'admin'
            session['username'] = 'Admin'
            return redirect(url_for('sensor_dashboard'))
        flash('Invalid admin credentials', 'error')
        return redirect(url_for('admin_login'))
    return render_template('admin_login.html')

# ---------------- LOGIN GUARD ----------------
@app.before_request
def require_login():
    open_routes = ['login', 'register', 'static', 'set_language', 'landing', 'admin_login']
    if request.endpoint is None:
        return
    if request.endpoint not in open_routes and 'user_id' not in session:
        return redirect(url_for('login'))

# ---------------- LANGUAGE ----------------
@app.route("/set_language", methods=["GET"])
def set_language():
    lang = request.args.get("lang", "en")
    session["lang"] = lang
    return redirect(request.referrer or url_for("home"))

@app.before_request
def set_default_lang():
    if "lang" not in session:
        session["lang"] = "en"

@app.context_processor
def inject_translations():
    lang = session.get("lang", "en")
    return dict(lang=lang, t=TRANSLATIONS.get(lang, TRANSLATIONS["en"]))

# ---------------- ROUTES ----------------
@app.route("/")
def landing():
    return render_template("home.html")

@app.route("/dashboard")
def home():
    return render_template("index.html")

# --------------- API: LATEST SENSOR (Firebase) ---------------
@app.route('/latest', methods=['GET'])
def get_latest():
    try:
        if not init_firebase_if_possible():
            return jsonify({"status": "error", "message": "Firebase not initialized"}), 503

        # Try soil first (numeric keys), then sensor_data (ordered by key)
        ref_soil = firebase_db.reference('soil')
        data = ref_soil.get() or {}

        latest = None
        if isinstance(data, dict) and data:
            try:
                latest_key = max((int(k) for k in data.keys()))
                latest = data[str(latest_key)]
            except Exception:
                latest_key = sorted(data.keys())[-1]
                latest = data[latest_key]
        else:
            ref_sd = firebase_db.reference('sensor_data')
            snap = ref_sd.order_by_key().limit_to_last(1).get() or {}
            if isinstance(snap, dict) and snap:
                latest = list(snap.values())[0]

        if latest:
            return jsonify({"status": "success", "latest_data": latest}), 200
        return jsonify({"status": "error", "message": "No data found"}), 404
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500

@app.route("/crops")
def crops():
    q = (request.args.get("q") or "").strip().lower()
    lang = session.get("lang", "en")
    cur = mysql.connection.cursor()
    cur.execute(
        "SELECT slug, name, namekn, seasons, seasonskn, durationdays, durationcategory, durationcategorykn, "
        "sowingwindow, sowingwindowkn, harvestwindow, harvestwindowkn, irrigation, irrigationkn, soilphmin, soilphmax, "
        "fertilizerbaseline, fertilizerbaselinekn, info, infokn, cultivationguide_climate, cultivationguide_soil, "
        "cultivationguide_seedrate, cultivationguide_spacing, cultivationguide_yield, "
        "cultivationguidekn_climate, cultivationguidekn_soil, cultivationguidekn_seedrate, cultivationguidekn_spacing, cultivationguidekn_yield "
        "FROM crops"
    )
    rows = cur.fetchall()
    cur.close()

    crops_list = []
    for r in rows:
        crops_list.append({
            "slug": r[0],
            "name": r[1],
            "name_kn": r[2],
            "seasons": (r[3] or "").split(","),
            "seasons_kn": (r[4] or "").split(","),
            "duration_days": r[5],
            "duration_category": r[6],
            "duration_category_kn": r[7],
            "sowing_window": r[8],
            "sowing_window_kn": r[9],
            "harvest_window": r[10],
            "harvest_window_kn": r[11],
            "irrigation": r[12],
            "irrigation_kn": r[13],
            "soil_ph_min": r[14],
            "soil_ph_max": r[15],
            "fertilizer_baseline": r[16],
            "fertilizer_baseline_kn": r[17],
            "info": r[18],
            "info_kn": r[19],
            "cultivation_guide": {
                "climate": r[20], "soil": r[21], "seed_rate": r[22], "spacing": r[23], "yield": r[24]
            },
            "cultivation_guide_kn": {
                "climate": r[25], "soil": r[26], "seed_rate": r[27], "spacing": r[28], "yield": r[29]
            }
        })

    if q:
        crops_list = [c for c in crops_list if q in c["name"].lower()]

    return render_template("crops.html", crops=crops_list, q=q, lang=lang)

@app.route("/crops/<slug>")
def crop_detail(slug):
    lang = session.get("lang", "en")
    cur = mysql.connection.cursor()
    cur.execute(
        "SELECT slug, name, namekn, seasons, seasonskn, durationdays, durationcategory, durationcategorykn, "
        "sowingwindow, sowingwindowkn, harvestwindow, harvestwindowkn, irrigation, irrigationkn, soilphmin, soilphmax, "
        "fertilizerbaseline, fertilizerbaselinekn, info, infokn FROM crops WHERE slug=%s",
        (slug,)
    )
    row = cur.fetchone()
    cur.close()

    if not row:
        return render_template("crop_detail.html", crop=None, lang=lang), 404

    crop = {
        "slug": row[0],
        "name": row[1],
        "name_kn": row[2],
        "seasons": (row[3] or "").split(","),
        "seasons_kn": (row[4] or "").split(","),
        "duration_days": row[5],
        "duration_category": row[6],
        "duration_category_kn": row[7],
        "sowing_window": row[8],
        "sowing_window_kn": row[9],
        "harvest_window": row[10],
        "harvest_window_kn": row[11],
        "irrigation": row[12],
        "irrigation_kn": row[13],
        "soil_ph_min": row[14],
        "soil_ph_max": row[15],
        "fertilizer_baseline": row[16],
        "fertilizer_baseline_kn": row[17],
        "info": row[18],
        "info_kn": row[19]
    }
    return render_template("crop_detail.html", crop=crop, lang=lang)

@app.route("/fertilizers")
def fertilizers():
    lang = request.args.get("lang") or session.get("lang", "en")

    cur = mysql.connection.cursor()
    cur.execute("SELECT id, name, namekn, npk, use_info, usekn, when_info, whenkn, where_info, wherekn, notes, noteskn FROM fertilizers")
    rows = cur.fetchall()
    cur.close()

    fertilizers = []
    for r in rows:
        fertilizers.append({
            "id": r[0],
            "name": r[1],
            "name_kn": r[2],
            "npk": r[3],
            "use": r[4],
            "use_kn": r[5],
            "when": r[6],
            "when_kn": r[7],
            "where": r[8],
            "where_kn": r[9],
            "notes": r[10],
            "notes_kn": r[11]
        })

    return render_template("fertilizers.html", fertilizers=fertilizers, lang=lang)

# ---------------- GUIDE ----------------
@app.route("/guide", methods=["GET"])
def guide():
    return render_template("guide.html")

@app.route("/guide/result", methods=["GET", "POST"])
def guide_result():
    if request.method == "GET":
        return redirect(url_for("guide"))

    season = request.form.get("season")
    irrigation = request.form.get("irrigation")
    ph = request.form.get("soil_ph")
    duration = request.form.get("duration")
    lang = session.get("lang", "en")

    # Normalize selections using canonical buckets to match DB values irrespective of language synonyms
    season_synonyms = {
        "kharif": {"kharif", "rainy", "ಮಳೆಯಗಾಲ"},
        "rabi": {"rabi", "winter", "ಚಳಿಗಾಲ"},
        "zaid": {"zaid", "summer", "ಬೇಸಿಗೆ"},
        "any": {"any", "ಯಾವುದೇ"}
    }
    irrigation_synonyms = {
        "irrigated": {"irrigated", "ನೀರಾವರಿ"},
        "rainfed": {"rainfed", "ಮಳೆಯಾಧಾರಿತ"},
        "any": {"any", "ಯಾವುದೇ"}
    }
    duration_synonyms = {
        "short": {"short", "ಕಡಿಮೆ ಅವಧಿ"},
        "medium": {"medium", "ಮಧ್ಯಮ ಅವಧಿ"},
        "long": {"long", "ದೀರ್ಘ ಅವಧಿ"},
        "any": {"any", "ಯಾವುದೇ"}
    }

    def to_canonical(value: str, groups: dict, default_key: str = "any") -> str:
        v = (value or "any").strip().lower()
        for key, vals in groups.items():
            if v in vals:
                return key
        return default_key

    selected_season_key = to_canonical(season, season_synonyms)
    selected_irrigation_key = to_canonical(irrigation, irrigation_synonyms)
    selected_duration_key = to_canonical(duration, duration_synonyms)

    cur = mysql.connection.cursor()
    cur.execute("SELECT slug, name, namekn, seasons, seasonskn, durationdays, durationcategory, durationcategorykn, sowingwindow, sowingwindowkn, harvestwindow, harvestwindowkn, irrigation, irrigationkn, soilphmin, soilphmax, fertilizerbaseline, fertilizerbaselinekn, info, infokn FROM crops")
    rows = cur.fetchall()
    cur.close()

    results = []
    for r in rows:
        # Normalize crop attributes
        seasons_raw = [(s or "").strip().lower() for s in (r[3] or "").split(",") if s is not None]
        crop_season_keys = set()
        for s in seasons_raw:
            for key, vals in season_synonyms.items():
                if s in vals:
                    crop_season_keys.add(key)
        irrigation_val_key = to_canonical(r[12], irrigation_synonyms)
        duration_val_key = to_canonical(r[6], duration_synonyms)
        soil_min, soil_max = r[14], r[15]

        # Apply filters
        if selected_season_key != "any" and selected_season_key not in crop_season_keys:
            continue
        if selected_irrigation_key != "any" and irrigation_val_key != selected_irrigation_key:
            continue
        if ph:
            try:
                ph_val = float(ph)
                # Only enforce if DB bounds exist
                if soil_min is not None and soil_max is not None:
                    if not (float(soil_min) <= ph_val <= float(soil_max)):
                        continue
            except Exception:
                pass
        if selected_duration_key != "any" and duration_val_key != selected_duration_key:
            continue

        crop = {
            "slug": r[0], "name": r[1], "name_kn": r[2],
            "seasons": (r[3] or "").split(","), "seasons_kn": (r[4] or "").split(","),
            "duration_category": r[6], "duration_category_kn": r[7],
            "sowing_window": r[8], "sowing_window_kn": r[9],
            "harvest_window": r[10], "harvest_window_kn": r[11],
            "irrigation": r[12], "irrigation_kn": r[13],
            "fertilizer_baseline": r[16], "fertilizer_baseline_kn": r[17],
            "info": r[18], "info_kn": r[19]
        }
        results.append({"crop": crop})

    hint = None
    if not results:
        hint = TRANSLATIONS[lang]["result_hint"]

    return render_template("guide_result.html", results=results, hint=hint)

# ---------------- SENSOR DASHBOARD ----------------
@app.route("/sensor_dashboard", methods=["GET", "POST"])
def sensor_dashboard():
    # Admin-only access
    if not session.get('is_admin'):
        flash("Admin access required", "error")
        return redirect(url_for('admin_login'))

    # Prefer Firebase latest value; fallback to MySQL
    sensor, fb_email = get_firebase_latest_sensor()
    if not sensor:
        cur = mysql.connection.cursor()
        row = None
        try:
            try:
                cur.execute("SELECT email, nitrogen, phosphorus, potassium, moisture, temperature, ph, recommendation FROM sensor_data ORDER BY id DESC LIMIT 1")
                row = cur.fetchone()
            except:
                cur.execute("SELECT email, nitrogen, phosphorus, potassium, moisture, temperature, ph, recommendation FROM sensor_data ORDER BY created_at DESC LIMIT 1")
                row = cur.fetchone()
        finally:
            cur.close()

        if row:
            sensor = {
                'N': row[1] or 0,
                'P': row[2] or 0,
                'K': row[3] or 0,
                'moisture': row[4] or 0,
                'temp': row[5] or 0,
                'ph': row[6] or 7,
            }
            fb_email = row[0]

    recommendations = []
    lang = session.get('lang', 'en')

    if request.method == 'POST':
        # Validate presence of sensor data first
        if not sensor:
            flash('No sensor data available yet. Please try again later.', 'error')
            return render_template("sensor_dashboard.html", sensor=sensor, recommendations=recommendations)

        # Build recommendations from DB thresholds
        param_map = {
            'N': float(sensor['N']),
            'P': float(sensor['P']),
            'K': float(sensor['K']),
        
            'pH': float(sensor['ph']),
            'Moisture': float(sensor.get('moisture', 0)),
            'Temperature': float(sensor.get('temp', 0))
        }

        cur = mysql.connection.cursor(DictCursor)

        sql = (
            "SELECT parameter, operator, threshold, severity, meaning_en, meaning_kn, recommendation_en, recommendation_kn "
            "FROM soil_recommendations WHERE parameter=%s AND ("
            " (LOWER(operator) IN ('range','between') AND CAST(SUBSTRING_INDEX(threshold,'-',1) AS DECIMAL(10,3)) <= %s AND %s <= CAST(SUBSTRING_INDEX(threshold,'-',-1) AS DECIMAL(10,3))) OR "
            " (operator = '<'  AND %s <  CAST(threshold AS DECIMAL(10,3))) OR "
            " (operator = '>'  AND %s >  CAST(threshold AS DECIMAL(10,3))) OR "
            " (operator = '<=' AND %s <= CAST(threshold AS DECIMAL(10,3))) OR "
            " (operator = '>=' AND %s >= CAST(threshold AS DECIMAL(10,3))) OR "
            " (operator = '='  AND %s =  CAST(threshold AS DECIMAL(10,3))) OR "
            " ((operator IS NULL OR operator='') AND ("
            "   (INSTR(threshold,'-')>0 AND CAST(SUBSTRING_INDEX(threshold,'-',1) AS DECIMAL(10,3)) <= %s AND %s <= CAST(SUBSTRING_INDEX(threshold,'-',-1) AS DECIMAL(10,3))) OR "
            "   (LEFT(threshold,1)='<' AND %s < CAST(SUBSTRING(threshold,2) AS DECIMAL(10,3))) OR "
            "   (LEFT(threshold,1)='>' AND %s > CAST(SUBSTRING(threshold,2) AS DECIMAL(10,3)))"
            "))) "
            "LIMIT 1"
        )

        for param, value in param_map.items():
            params = [
                param,
                value, value,           # range
                value,                  # <
                value,                  # >
                value,                  # <=
                value,                  # >=
                value,                  # =
                value, value,           # legacy range
                value,                  # legacy <
                value                   # legacy >
            ]

            cur.execute(sql, params)
            r = cur.fetchone()
            if not r:
                continue

            rec_text = r['recommendation_kn'] if lang == 'kn' else r['recommendation_en']
            meaning_text = r['meaning_kn'] if lang == 'kn' else r['meaning_en']
            severity = (r['severity'] or '').strip()

            if rec_text:
                if meaning_text and severity:
                    recommendations.append(f"{rec_text} ({severity}) - {meaning_text}")
                elif severity:
                    recommendations.append(f"{rec_text} ({severity})")
                elif meaning_text:
                    recommendations.append(f"{rec_text} - {meaning_text}")
                else:
                    recommendations.append(rec_text)

        cur.close()

        if not recommendations:
            if lang == 'kn':
                recommendations.append("ನಿಮ್ಮ ಮಣ್ಣು ಸಮತೋಲನದಲ್ಲಿದೆ. ಎಫ್‌ವೈಎಮ್/ಕಂಪೋಸ್ಟ್ ಬಳಸಿ ನಿರ್ವಹಿಸಿ")
            else:
                recommendations.append("Your soil looks balanced. Maintain with FYM/Compost")

        # Handle email entered by user and send recommendations
        email = (request.form.get('email') or '').strip()
        email_pattern = r"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"
        if not re.match(email_pattern, email):
            flash('Please enter a valid email address.', 'error')
        else:
            try:
                subject = "ಮಣ್ಣು ಶಿಫಾರಸುಗಳು - ಕೃಷಿ ದಿಶಾ" if lang == 'kn' else "Soil Recommendations - Krishi Disha"
                if lang == 'kn':
                    body_header = f"ನಿಮ್ಮ ಇತ್ತೀಚಿನ ಮಣ್ಣು ಪಠ್ಯಗಳು:\nN: {sensor['N']}, P: {sensor['P']}, K: {sensor['K']}, pH: {sensor['ph']}\n\nಶಿಫಾರಸುಗಳು:\n"
                else:
                    body_header = f"Your latest soil readings:\nN: {sensor['N']}, P: {sensor['P']}, K: {sensor['K']}, pH: {sensor['ph']}\n\nRecommendations:\n"
                body = body_header + "\n".join(recommendations)

                msg = Message(subject=subject,
                              sender=app.config['MAIL_USERNAME'],
                              recipients=[email],
                              body=body)
                mail.send(msg)
                print(f"[SUCCESS] Initial recommendation email sent to {email}")
                
                # Schedule follow-up email to be sent after 2 minutes
                print(f"[INFO] Scheduling follow-up email for {email} in 2 minutes...")
                print(f"[DEBUG] Sensor data being passed: {sensor}")
                send_followup_email(email, lang, sensor)
                
                flash(('ಶಿಫಾರಸುಗಳನ್ನು ನಿಮ್ಮ ಇಮೇಲ್‌ಗೆ ಕಳುಹಿಸಲಾಗಿದೆ.' if lang == 'kn' else 'Recommendations have been sent to your email.'), 'success')
            except Exception as e:
                print('Failed to send email:', e)
                flash(('ಇಮೇಲ್ ಕಳುಹಿಸುವಲ್ಲಿ ದೋಷ ಸಂಭವಿಸಿದೆ.' if lang == 'kn' else 'Failed to send email.'), 'error')

    # Return template for both GET and POST requests
    return render_template("sensor_dashboard.html", sensor=sensor, recommendations=recommendations)

# ---------------- MANUAL EMAIL PROCESSING ----------------
@app.route("/process_emails")
def process_emails():
    """Manually process scheduled follow-up emails"""
    if not session.get('is_admin'):
        flash("Admin access required", "error")
        return redirect(url_for('admin_login'))
    
    process_scheduled_emails()
    flash("Scheduled emails processed", "success")
    return redirect(url_for('sensor_dashboard'))


    # Process any pending scheduled emails on startup
if __name__ == "__main__":
    # Process any pending scheduled emails on startup
    print(f"[{time.strftime('%H:%M:%S')}] Starting Krishi Disha app...")
    
    # Create database tables if they don't exist
    print(f"[{time.strftime('%H:%M:%S')}] Checking database tables...")
    create_tables()
    
    print(f"[{time.strftime('%H:%M:%S')}] Processing any pending scheduled emails...")
    process_scheduled_emails()
    print(f"[{time.strftime('%H:%M:%S')}] App ready!")
    app.run(debug=True, host='0.0.0.0', port=int(os.environ.get('PORT', 5001)))
