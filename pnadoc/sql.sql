create trigger tgr_MainMail_insert
on MainMail
    for insert --���봥��
as
    --�������
    declare @id INT,@userid int;
    --��inserted���в�ѯ�Ѿ������¼��Ϣ
    select @id = id,@userid=CreateID FROM  inserted;
    
  
    INSERT INTO dbo.Mail_Link_User
            ( UserID, ID, StatusID, CreateTime )
    VALUES  ( @userid, -- UserID - bigint
              @id, -- ID - int
              1, -- StatusID - int
              GETDATE()  -- CreateTime - datetime
              )
GO

