Drop Database If Exists Testing_System_Assignment_2; 
Create Database If Not Exists Testing_System_Assignment_2;
Use Testing_System_Assignment_2;

Drop Table If Exists `ExamQuestion`;
Drop Table If Exists `Exam`;
Drop Table If Exists `Answer`;
Drop Table If Exists `Question`;
Drop Table If Exists `CategoryQuestion`;
Drop Table If Exists `TypeQuestion`;
Drop Table If Exists `GroupAccount`;
Drop Table If Exists `Group`;
Drop Table If Exists `Account`;
Drop Table If Exists `Position`;
Drop Table If Exists `Department`;

Create Table `Department`
(
	DepartmentID 		Tinyint Unsigned Auto_Increment Primary Key,
	DepartmentName 		Varchar(30) Not Null Unique key
);

Create Table `Position`
(
	PositionID 			Tinyint Unsigned Auto_Increment Primary Key,
	PositionName 		Enum('Dev','Test','Scrum Master','PM') Not Null Unique Key
);

Create Table `Account`
(
	AccountID 			Tinyint Unsigned Auto_Increment Primary Key,
	Email 				Varchar(50) Not Null Unique key,
	UserName 			Varchar(50) Not Null Unique Key,
	FullName 			Varchar(50) Not Null,
	DepartmentID 		Tinyint Unsigned Not Null,
	PositionID 			Tinyint Unsigned Not Null,
	CreateDate 			Datetime Default Now(),
    Foreign Key(DepartmentID) References Department(DepartmentID),
	Foreign Key(PositionID) References `Position`(PositionID)
);

Create Table `Group`
(
	GroupID				Tinyint unsigned auto_increment primary key,
    GroupName			Varchar(60) Not Null unique key,
    CreatorID			Tinyint Unsigned Not Null,
    CreateDate			Datetime Default Now()
);

Create Table `GroupAccount`
(
	GroupID				Tinyint Unsigned Not Null,
    AccountID			Tinyint Unsigned Not Null,
    JoinDate			Datetime Default Now(),
    Primary Key(GroupID,AccountID),
	Foreign Key(GroupID) References `Group`(GroupID),
	Foreign Key(AccountID) References `Account`(AccountID)
);

Create Table `TypeQuestion`
(
	TypeID				Tinyint Unsigned Auto_Increment Primary Key,
    TypeName			Enum('Essay','Multiple-Choice') Not Null Unique Key
);


Create Table `CategoryQuestion`
(
	CategoryID			Tinyint Unsigned Auto_Increment Primary Key,
    CategoryName		Nvarchar(50) Not Null Unique Key
);

Create Table `Question`
(
	QuestionID			Tinyint Unsigned Auto_Increment Primary Key,
    Content				Nvarchar(100) Not Null,
    CategoryID			Tinyint Unsigned Not Null,
    TypeID				Tinyint Unsigned Not Null,
    CreatorID			Tinyint Unsigned Not Null,
    CreateDate			Datetime Default Now(),
    Foreign Key(CategoryID) References CategoryQuestion(CategoryID),
	Foreign Key(TypeID) References TypeQuestion(TypeID),
	Foreign Key(CreatorID) References `Account`(AccountId)
);

Create Table `Answer`
(
	AnswerID			Tinyint Unsigned Auto_Increment Primary Key,
    Content				Nvarchar(100) Not Null,
    QuestionID			Tinyint Unsigned Not Null,
    IsCorrect 			Bit Default 1,
    Foreign Key(QuestionID) References Question(QuestionID)
);

Create Table `Exam`
(
	ExamID				Tinyint Unsigned Auto_Increment Primary Key,
    `Code`				Char(10) Not Null,
    Title				Nvarchar(50) Not Null,
    CategoryID			Tinyint Unsigned Not Null,
    Duration			Tinyint Unsigned Not Null,
    CreatorID			Tinyint Unsigned Not Null,
    CreateDate			Datetime Default Now(),
    Foreign Key(CategoryID) References CategoryQuestion(CategoryID),
    Foreign Key(CreatorID) References `Account`(AccountID)
);

Create Table `ExamQuestion`
(
	ExamID				Tinyint Unsigned Not Null,
    QuestionID			Tinyint Unsigned Not Null,
    Primary Key(ExamID,QuestionID),
    Foreign Key(QuestionID) References Question(QuestionID),
    Foreign Key(ExamID) References Exam(ExamID)
);



Insert Into `Department`(DepartmentName)
Values	
	('Marketing'	),
	('Sale'			),
	('Bảo Vệ'		),
	('Nhân Sự'		),
	('Kỹ Thuật'		),
	('Tài Chính'	),
	('Phó Giám Đốc'	),
	('Giám Đốc'		),
	('Thư Ký'		),
	('Lễ Tân'		),
    ('Bán Hàng'		)
;                        

Insert Into `Position`(PositionName)
Values
	('Dev'			),
    ('Test'			),
    ('Scrum Master'	),
    ('PM'			)
;

Insert Into `Account`(Email, UserName, FullName, DepartmentID, PositionID, CreateDate)
Values
	('Email1@gmail.com'	, 'UserName1'	, 'FullName1'	, 5	, 1, '2020-03-05'),
    ('Email2@gmail.com'	, 'UserName2'	, 'FullName2'	, 1	, 2, '2020-03-05'),
    ('Email3@gmail.com'	, 'UserName3'	, 'FullName3'	, 2	, 2, '2020-03-07'),
    ('Email4@gmail.com'	, 'UserName4'	, 'FullName4'	, 3	, 4, '2020-03-08'),
    ('Email5@gmail.com'	, 'UserName5'	, 'FullName5'	, 4	, 4, '2020-03-10'),
	('Email6@gmail.com'	, 'UserName6'	, 'FullName6'	, 6	, 3, '2020-04-05'),
	('Email7@gmail.com'	, 'UserName7'	, 'FullName7'	, 2	, 2, Null 		 ),
	('Email8@gmail.com'	, 'UserName8'	, 'FullName8'	, 8	, 1, '2020-04-07'),
	('Email9@gmail.com'	, 'UserName9'	, 'FullName9'	, 2	, 2, '2020-04-07'),
	('Email10@gmail.com', 'UserName10'	, 'FullName10'	, 10, 1, '2020-04-09'),
    ('Email11@gmail.com', 'UserName11'	, 'FullName11'	, 10, 1, Default	 ),
	('Email12@gmail.com', 'UserName12'	, 'FullName12'	, 10, 1, Default	 )
;

Insert Into `Group`(GroupName, CreatorID, CreateDate)
Values
	('Testing System'	, 5	, '2019-03-05'),
    ('Development'		, 1	, '2020-03-07'),
    ('VTI Sale 01'		, 2	, '2020-03-09'),
    ('VTI Sale 02'		, 3	, '2020-03-10'),
    ('VTI Sale 03'		, 4	, '2020-03-28'),
    ('VTI Creator'		, 6	, '2020-04-06'),
    ('VTI Marketing 01'	, 7	, '2020-04-07'),
    ('Management'		, 8	, '2020-04-08'),
    ('Chat With Love'	, 9	, '2020-04-09'),
    ('Vi Ti Ai'			, 10, '2020-04-10')
;

Insert Into `GroupAccount`(GroupID, AccountID, JoinDate)
Values 	
	(1	, 1	, '2019-03-05'),
	(1	, 2	, '2020-03-07'),
	(3	, 3	, '2020-03-09'),
	(3	, 4	, '2020-03-10'),
	(5	, 5	, '2020-03-28'),
	(1	, 3	, '2020-04-06'),
	(1	, 7	, '2020-04-07'),
	(8	, 3	, '2020-04-08'),
	(1	, 9	, '2020-04-09'),
	(10	, 10, '2020-04-10')
;

Insert Into `TypeQuestion`(TypeName)
Values 	
	('Essay'			),
	('Multiple-Choice'	)
;

Insert Into `CategoryQuestion`(CategoryName)
Values 	
	('Java'		),
	('ASP.NET'	),
	('ADO.NET'	),
	('SQL'		),
	('Postman'	),
	('Ruby'		),
	('Python'	),
	('C++'		),
	('C Sharp'	),
	('PHP'		)
;

Insert Into `Question`(Content , CategoryID, TypeID , CreatorID, CreateDate)
Values 	
	('Câu hỏi về Java'	, 1	, '1', '2'	, '2020-04-05'	),
	('Câu Hỏi về PHP'	, 10, '2', '2'	, '2020-04-05'	),
	('Hỏi về C#'		, 9	, '2', '3'	, '2020-04-06'	),
	('Hỏi về Ruby'		, 6	, '1', '4'	, '2020-04-06'	),
	('Hỏi về Postman'	, 5	, '1', '5'	, '2020-04-06'	),
	('Hỏi về ADO.NET'	, 3	, '2', '6'	, '2020-04-06'	),
	('Hỏi về ASP.NET'	, 2	, '1', '7'	, '2020-04-06'	),
	('Hỏi về C++'		, 8	, '1', '8'	, '2020-04-07'	),
	('Hỏi về SQL'		, 4	, '2', '9'	, '2020-04-07'	),
	('Hỏi về Python'	, 7	, '1', '10'	, '2020-04-07'	)
;

Insert Into `Answer`(Content, QuestionID, IsCorrect)
Values 	
	('Trả lời 01', 1, 0	),
	('Trả lời 02', 1, 1	),
	('Trả lời 03', 1, 0	),
	('Trả lời 04', 1, 1	),
	('Trả lời 05', 2, 1	),
	('Trả lời 06', 3, 1	),
	('Trả lời 07', 4, 0	),
	('Trả lời 08', 8, 0	),
	('Trả lời 09', 9, 1	),
	('Trả lời 10', 10, 1)
;

Insert Into `Exam`(`Code`, Title, CategoryID, Duration, CreatorID, CreateDate)
Values 	
	('VTIQ001', 'Đề thi C#'		, 1	, 60	, '5'	, '2019-04-05'		),
	('VTIQ002', 'Đề thi PHP'	, 10, 60	, '2'	, '2019-04-05'		),
	('VTIQ003', 'Đề thi C++'	, 9	, 120	, '2'	, '2019-04-07'		),
	('VTIQ004', 'Đề thi Java'	, 6	, 60	, '3'	, '2020-04-08'		),
	('VTIQ005', 'Đề thi Ruby'	, 5	, 120	, '4'	, '2020-04-10'		),
	('VTIQ006', 'Đề thi Postman', 3	, 60 	, '6'	, '2020-04-05'		),
	('VTIQ007', 'Đề thi SQL'	, 2	, 60 	, '7'	, '2020-04-05'		),
	('VTIQ008', 'Đề thi Python'	, 8	, 60 	, '8'	, '2020-04-07'		),
	('VTIQ009', 'Đề thi ADO.NET', 4	, 90 	, '9'	, '2020-04-07'		),
	('VTIQ010', 'Đề thi ASP.NET', 7	, 90 	, '10'	, '2020-04-08'		)
;

Insert Into `ExamQuestion`(ExamID , QuestionID )
Values 	
	(1	,	5	),
	(2	, 	10	),
	(3	, 	4	),
	(4	, 	3	),
	(5	, 	7	),
	(6	, 	10	),
	(7	, 	2	),
	(8	, 	10	),
	(9	, 	9	),
	(10	, 	8	)
;

















