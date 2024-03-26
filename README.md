# CAERSClient

INSTALL THIRD PARTY LIBRARIES
Download and install JSON Simple, ORG.JSON and PostgreSQL JDBC Driver after accepting their licenses.
JSON Simple is a popular open source JAVA parsing library and is used to parse the JSON. Download and install at C:\json-simple\json-simple-1.1.0.redhat-5.jar.
PostgreSQL JDBC Driver is used to perform PostgreSQL database operations. Download and install at C:\PostgreSQLJDBCDriver\postgresql-42.3.1.jar.
ORG.JSON is used for some exception handling. Download and install at C:\org.json.jar\org.json.jar.

CAERS CLIENT PROJECT SETUP
Download the files needed to build CAERS Client from https://github.com/AZDEQ/CAERSClient
Open Eclipse and click New, enter C:\Users\[Enter your Windows Username Here]\caers-workspace to create a new workspace called caers-workspace. Exit Eclipse. A .metadata file will be created in the caers-workspace folder.
Launch Eclipse and click Clone a Git repository. Use Repository URL: https://github.com/AZDEQ/CAERSClient and Workspace: C:\Users\[Your Windows Username]\caers-workspace
Before populating Source Git Repository, do the following:
Open Github Desktop --> File --> Clone repository --> Select AZDEQ/CAERSClient and click Clone. The Current Repository will have CAERSClient selected, select [Your Github branch name] from Current Branch. Click Fetch origin.
Authentication popup may appear again but files are copied to the workspace.
In Eclipse, click File --> Import --> General. Click Existing Projects into Workspace. In Import projects, browse to C:\Users\[Your Windows Username]\caers-workspace\CAERSClient\APIApp. Click Finish.
Configure Build Path
Right click APIApp in Eclipse --> Build Path --> Configure Build Path --> Libraries tab --> Select classpath --> click Add External JARS --> Add JARS C:\json-simple\json-simple-1.1.0.redhat-5.jar, C:\org.json.jar\org.json.jar and C:\PostgreSQLJDBCDriver\postgresql-42.3.1.jar --> Apply and close. Note that .classpath will be created under APIApp folder.
Project --> Clean.
Project --> Build.

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
