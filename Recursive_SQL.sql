CREATE TABLE Departments
(
  [ID] [int] NOT NULL
  , Name nvarchar(max)
  , ParentID int
);

INSERT INTO Departments (ID, Name, ParentID)
VALUES(1, 'Dept1', 1)
,(2, 'Dept2', 1)
,(3, 'Dept3', 1)
,(4, 'Dept4', 1)
,(5, 'Dept5', 2)
,(6, 'Dept6', 5);

WITH AllDepartments([ChosenDept], [ChildID], [ChildName], [ParentID], [ParentName])
AS
(
	SELECT Child.ID AS [ChosenDept]
	, Child.ID AS [ChildID]
	, Child.Name AS [ChildName]
	, Parent.ID AS [ParentID]
	, Parent.Name AS [ParentName]
	FROM Departments AS Child
	LEFT OUTER JOIN Departments AS Parent
	ON Child.ParentID = Parent.ID
	
	UNION ALL
	
	SELECT AllDepartments.ChosenDept AS [ChosenDept]
	, AllDepartments.ParentID AS [ChildID]
	, AllDepartments.ParentName AS [ChildName]
	, NewParent.ParentID AS [ParentID]
	, NewParentInfo.Name AS [ParentName]
	FROM AllDepartments
	INNER JOIN Departments AS NewParent
	ON AllDepartments.ParentID = NewParent.ID
	AND AllDepartments.ParentID <> AllDepartments.ChildID
	INNER JOIN Departments as NewParentInfo
	ON NewParent.ParentID = NewParentInfo.ID
)

SELECT AllDepartments.[ChildID]
, AllDepartments.[ChildName]
, AllDepartments.[ParentID]
, AllDepartments.[ParentName]
FROM AllDepartments
WHERE ChosenDept = 6;