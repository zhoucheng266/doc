create trigger tgr_MainMail_insert
on MainMail
    for insert --插入触发
as
    --定义变量
    declare @id INT,@userid int;
    --在inserted表中查询已经插入记录信息
    select @id = id,@userid=CreateID FROM  inserted;
    
  
    INSERT INTO dbo.Mail_Link_User
            ( UserID, ID, StatusID, CreateTime )
    VALUES  ( @userid, -- UserID - bigint
              @id, -- ID - int
              1, -- StatusID - int
              GETDATE()  -- CreateTime - datetime
              )
GO

