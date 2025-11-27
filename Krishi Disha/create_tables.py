import os
import MySQLdb

def create_tables():
    try:
        # Connect to MySQL using environment variables
        connection = MySQLdb.connect(
            host=os.environ.get('MYSQL_HOST', 'localhost'),
            user=os.environ.get('MYSQL_USER', 'root'),
            password=os.environ.get('MYSQL_PASSWORD', ''),
            database=os.environ.get('MYSQL_DB', 'krishidisha'),
            port=int(os.environ.get('MYSQL_PORT', 3306))
        )
        
        cursor = connection.cursor()
        
        # Create users table
        cursor.execute("""
            CREATE TABLE IF NOT EXISTS users (
                id INT AUTO_INCREMENT PRIMARY KEY,
                username VARCHAR(100) UNIQUE NOT NULL,
                password VARCHAR(255) NOT NULL,
                email VARCHAR(255) UNIQUE NOT NULL,
                fullname VARCHAR(255),
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            )
        """)
        
        # Create crops table
        cursor.execute("""
            CREATE TABLE IF NOT EXISTS crops (
                id INT AUTO_INCREMENT PRIMARY KEY,
                slug VARCHAR(100) UNIQUE NOT NULL,
                name VARCHAR(255) NOT NULL,
                namekn VARCHAR(255),
                seasons TEXT,
                seasonskn TEXT,
                durationdays INT,
                durationcategory VARCHAR(50),
                durationcategorykn VARCHAR(100),
                sowingwindow TEXT,
                sowingwindowkn TEXT,
                harvestwindow TEXT,
                harvestwindowkn TEXT,
                irrigation VARCHAR(100),
                irrigationkn VARCHAR(100),
                soilphmin DECIMAL(3,1),
                soilphmax DECIMAL(3,1),
                fertilizerbaseline TEXT,
                fertilizerbaselinekn TEXT,
                info TEXT,
                infokn TEXT,
                cultivationguide_climate TEXT,
                cultivationguide_soil TEXT,
                cultivationguide_seedrate TEXT,
                cultivationguide_spacing TEXT,
                cultivationguide_yield TEXT,
                cultivationguidekn_climate TEXT,
                cultivationguidekn_soil TEXT,
                cultivationguidekn_seedrate TEXT,
                cultivationguidekn_spacing TEXT,
                cultivationguidekn_yield TEXT
            )
        """)
        
        # Create fertilizers table
        cursor.execute("""
            CREATE TABLE IF NOT EXISTS fertilizers (
                id INT AUTO_INCREMENT PRIMARY KEY,
                name VARCHAR(255) NOT NULL,
                namekn VARCHAR(255),
                npk VARCHAR(50),
                use_info TEXT,
                usekn TEXT,
                when_info TEXT,
                whenkn TEXT,
                where_info TEXT,
                wherekn TEXT,
                notes TEXT,
                noteskn TEXT
            )
        """)
        
        # Create sensor_data table
        cursor.execute("""
            CREATE TABLE IF NOT EXISTS sensor_data (
                id INT AUTO_INCREMENT PRIMARY KEY,
                email VARCHAR(255),
                nitrogen DECIMAL(10,2),
                phosphorus DECIMAL(10,2),
                potassium DECIMAL(10,2),
                moisture DECIMAL(10,2),
                temperature DECIMAL(10,2),
                ph DECIMAL(3,1),
                recommendation TEXT,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            )
        """)
        
        # Create soil_recommendations table
        cursor.execute("""
            CREATE TABLE IF NOT EXISTS soil_recommendations (
                id INT AUTO_INCREMENT PRIMARY KEY,
                parameter VARCHAR(50) NOT NULL,
                operator VARCHAR(10),
                threshold VARCHAR(50),
                severity VARCHAR(20),
                meaning_en TEXT,
                meaning_kn TEXT,
                recommendation_en TEXT,
                recommendation_kn TEXT
            )
        """)
        
        connection.commit()
        cursor.close()
        connection.close()
        
        print("✅ All tables created successfully!")
        return True
        
    except Exception as e:
        print(f"❌ Error creating tables: {e}")
        return False

if __name__ == "__main__":
    create_tables()
