INTRODUCTION

CAERS is an EPA managed web portal that allows State, Local, or Tribal authorities to report their air emissions to fulfil statutory reporting and other requirements. Visit https://www.epa.gov/combined-air-emissions-reporting/combined-air-emissions-reporting-system-caers for more information on CAERS.

CAERS Client retrieves air emissions data from CAERS that was reported by their industry to the CAERS system and stores it in a database similar to CAERS for internal processing like billing, analytics, etc. CAERS Client utilizes REST capabilities exposed by CAERS and specified in https://exchangenetwork.net/data-exchange/combined-air-emissions-reporting-system-caers/. CAERS Client is an open source console application and has been developed utilizing JAVA as the developmental language and PostgreSQL as the backend database. It can be executed from a workstation or hosted on a server. AZDEQ utilizes AWS services to host the database and the application and also perform services like scheduling.

CLONE REPOSITORY FROM GITHUB

Launch Eclipse and click New, enter C:\Users\[Enter your Windows Username Here]\caersclient-workspace to create a new workspace called caersclient-workspace and exit Eclipse. A .metadata folder will be created in the recently created caersclient-workspace folder.
Download and install Github Desktop. Launch Github Desktop, File --> URL tab --> Clone repository and enter https://github.com/AZDEQ/CAERSClientPublic in Repository URL and C:\Users\<your user>\caersclient-workspace\CAERSClient in Local path.and click Clone.
Launch Eclipse and click caersclient-workspace. Click Import Existing Projects. Browse and select the CAERSClient folder. Select the APIApp project and click Finish.

INSTALL JRE

Download and install jdk-17_windows-x64_bin.exe from https://www.oracle.com/java/technologies/downloads/#jdk17-windows
From Eclipse: Windows --> Preferences --> Java --> Installed JREs --> Click Add --> Select Standard VM --> Next --> Enter C:\Program Files\Java\jdk-17 in JRE Home. You will see C:\Program Files\Java\jdk-17\lib\jrt-fs.jar prepopulated in JRE system libraries. Click Finish --> Make jdk-17 the default in the Installed JREs popup --> Apply and close

SET ENVIRONMENT VARIABLES

Control Panel --> System --> Advanced System Settings --> Environment Variables
Set JAVA_HOME TO C:\Program Files\Java\jdk-17
Add C:\Program Files\Java\jdk-17\bin to System Variables Path and move it up to the top of the list.

INSTALL THIRD PARTY LIBRARIES

Download and install JSON Simple, ORG.JSON and PostgreSQL JDBC Driver after accepting their licenses.
JSON Simple is a popular open source JAVA parsing library and is used to parse the JSON. Download and install at C:\json-simple\json-simple-1.1.0.redhat-5.jar.
PostgreSQL JDBC Driver is used to perform PostgreSQL database operations. Download and install at C:\PostgreSQLJDBCDriver\postgresql-42.3.1.jar.
ORG.JSON is used for some exception handling. Download and install at C:\org.json.jar\org.json.jar.

CONFIGURE BUILD PATH

The .classpath should have the build paths of the external JARs' preconfigured. If you have installed the JARS in a different location than that specified in the .classpath, update the build paths as folllows.

Right click APIApp in Eclipse --> Build Path --> Configure Build Path --> Libraries tab --> Select classpath --> click Add External JARS --> Add JARS C:\json-simple\json-simple-1.1.0.redhat-5.jar, C:\org.json.jar\org.json.jar and C:\PostgreSQLJDBCDriver\postgresql-42.3.1.jar --> Apply and close. Note that .classpath will be created under APIApp folder.
Project --> Clean.
Project --> Build.

DATABASE SETUP
Download and install the latest version of pgAdmin from https://www.pgadmin.org/. Launch pgAdmin. Right click Servers --> Register --> Server. In the General tab, enter a name, e.g., CAERSClientDeveopment. In the Connection tab, provide a connection string, e.g., localhost, AWS RDS connection string. Leave the default value 5432 for Port. Leave the default value postgres for Maintenance Database and Username. Use the default values for tabs Parameters, SSH Tunnel and Advanced. Click Save to create a server. Expand the server hive. Right click Databases --> Create Database. Enter CAERSLocal for Database Name, leave remaining tabs with default values and click Save. This will create the CAERSLocal database.
From pgAdmin, right click CAERSLocal database and click Query Tool. Click the Open File icon above the Query window and browse to \caersclient-workspace\CAERSClient\Database\Tables and select Create.sql and click Open. Create.sql contains a script to create CAERSLocal database objects like tables, sequences, constraints, keys and grant/revoke privileges. Go to the last few lines of Create.sql and locate the placeholder for setting up the password for user CAERS_READONLY. This line looks like this: CREATE USER CAERS_READONLY WITH PASSWORD '[Enter the password that you would like to set for user CAERS_READONLY here]';. Replace the placeholder with the password that you would like to set for user CAERS_READONLY. Click Execute script to execute this script and all datbase objects will be created. Next populate the reference tables by executing the scripts located at \caersclient-workspace\CAERSClient\Database\Tables\Initialize in alphabetical order. Due to dependencies, load tables unit_measure_code and calculation_material_code prior to energy_conversion_factor and table fips_state_code before fips_county.

CONFIGURE APPLICATION SETTINGS

Edit the config.properties file located in the root folder. You will need to set the PostgreSQL connection string, password for user postgres, EPA API clientId and clientSecret.
Prepend the PostgreSQL server instance endpoint with jdbc:postgresql://. Append the PostgreSQL server instance endpoint with :5432/CAERSLocal. Note that 5432 is the PostgreSQL server port and CAERSLocal is the database name. Example of a local connection string: jdbc:postgresql://localhost:5432/CAERSLocal. Example of an AWS RDS connection string is jdbc:postgresql://caersclientdev1db.chrockhsvvus.us-east-2.rds.amazonaws.com:5432/CAERSLocal. 
To obtain a EPA API clientId and clientSecret, Contact the contact person listed in https://exchangenetwork.net/data-exchange/combined-air-emissions-reporting-system-caers/.

CREATE JAR

Right click project APIApp --> Export --> Expand Java --> Select Java (JAR file) --> Click Next
JAR File Specification: Check APIApp (src) --> Set the export destination for JAR file to C:\CAERSClient\caersclient.jar. Check Export generated JAR file and resources and Compress the contents of the JAR file. Click Next.
JAR Packaging Options: Check Export class files with compile errors, Export class files with compile warnings and Build projects if not built automatically. Click Next.
JAR Manifest Specification: Click Browse in Main class and select main – APIApp/src. main.ParseJSON will appear in the Main class textbox. Click Finish.
Open C:\CAERSClient in File Explorer. Right click caersclient.jar --> 7-Zip --> Extract here.

RUN JAR

Open command prompt as Administrator.
cd C:\ caersclient
java -jar caersclient.jar

CAERSCLIENT OUTPUT

You will notice the program output similar to the following:

c:\CAERSClient>java -jar caersclient.jar
Total number of reports to process: 11; Reporting Year: 2022
2024-03-25T14:54:34.059006100 PROCESSING: Facility Id 447; Report Id 3280. Please wait...
2024-03-25T14:54:34.060006900 SKIPPED (Date match): Facility Id: 447; Report Id: 3280; Status: APPROVED.
2024-03-25T14:54:34.114005200 PROCESSING: Facility Id 2512; Report Id 3823. Please wait...
2024-03-25T14:54:34.114005200 SKIPPED (Date match): Facility Id: 2512; Report Id: 3823; Status: APPROVED.
2024-03-25T14:54:34.165008700 PROCESSING: Facility Id 2412; Report Id 3822. Please wait...
2024-03-25T14:54:34.165008700 SKIPPED (Date match): Facility Id: 2412; Report Id: 3822; Status: APPROVED.

...

End of processing

c:\CAERSClient
