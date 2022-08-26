Drop Database If Exists ngoc_long;
Create Database If Not Exists Testing_System_Assignment_1;
Use Testing_System_Assignment_1;

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
    Titile				Nvarchar(50) Not Null,
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
	('Email1@gmail.com', 'UserName1', 'FullName1', 5, 1, '2020-03-05'),
    ('Email2@gmail.com', 'UserName2', 'FullName2', 1, 2, '2020-03-05'),
    ('Email3@gmail.com', 'UserName3', 'FullName3', 2, 2, '2020-03-07')
    




















