create database dbjobportal
use dbjobportal


create table admin(
AdminId int primary key identity,
AdminName varchar(50),
AdminEmail varchar(50),
AdminPassword varchar (50),
InsertedDate date,
Status int default 0
)

insert into admin (AdminName,AdminEmail,AdminPassword,InsertedDate)values('admin','admin','admin',GETDATE());

select*from admin

create procedure proc_admin
@adminid int,
@adminNewPassword varchar(50)=null,
@adminCurrentPassword varchar(50)=null

as
begin
update admin set AdminPassword=@adminNewPassword
where AdminId=@adminid and AdminPassword=@adminCurrentPassword
end



















create table tblquestions
(
QuestionId int primary key identity,
QuestionName varchar(50)
)
insert into tblquestions(QuestionName) values('what is chilhood name ?')
insert into tblquestions(QuestionName) values('what is your favorite food name ?')
insert into tblquestions(QuestionName) values('what is your first teacher name ?')

create table tblJobProfile
(
JobProfileId int primary key identity,
JobProfileName varchar(50)
)
insert into tblJobProfile(JobProfileName) values('.Net Developer')
insert into tblJobProfile(JobProfileName) values('Java Developer')
insert into tblJobProfile(JobProfileName) values('Php Developer')
insert into tblJobProfile(JobProfileName) values('Testing')
insert into tblJobProfile(JobProfileName) values('HR ')
insert into tblJobProfile(JobProfileName) values('Sales')


create table tblQualifications
(
QualificationId int primary key identity,
QualificationName varchar(50)
)
insert into tblQualifications(QualificationName) values('M.Tech')
insert into tblQualifications(QualificationName) values('B.Tech')
insert into tblQualifications(QualificationName) values('MCA')
insert into tblQualifications(QualificationName) values('BCA')
insert into tblQualifications(QualificationName) values('Diploma')
insert into tblQualifications(QualificationName) values('Polytecnic')

create table tblState
(
StateId int primary key identity,
StateName varchar(50)
)
insert into tblState(StateName) values('Delhi')
insert into tblState(StateName) values('Uttar Pradesh')
insert into tblState(StateName) values('Bihar')
insert into tblState(StateName) values('Punjab')
insert into tblState(StateName) values('Gujrat')
insert into tblState(StateName) values('Rajasthan')

create table tblCity
(
CityId int primary key identity,
StateId int,
CityName varchar(50)
)
insert into tblCity(StateId,CityName) values(1,'Laxmi nagar')
insert into tblCity(StateId,CityName) values(1,'janakpuri')
insert into tblCity(StateId,CityName) values(2,'Lucknow')
insert into tblCity(StateId,CityName) values(2,'Kanpur')
insert into tblCity(StateId,CityName) values(2,'Varanasi')
insert into tblCity(StateId,CityName) values(2,'Ballia')
insert into tblCity(StateId,CityName) values(3,'Patna')
insert into tblCity(StateId,CityName) values(3,'Motihari')
insert into tblCity(StateId,CityName) values(4,'Amritsar')
insert into tblCity(StateId,CityName) values(4,'Ludhiana')
insert into tblCity(StateId,CityName) values(5,'Ahemadabad')
insert into tblCity(StateId,CityName) values(5,'Surat')
insert into tblCity(StateId,CityName) values(6,'Jaipur')
insert into tblCity(StateId,CityName) values(6,'Jaisalmer')



select*from tblJobSeeker

create table tblJobSeeker
(
JobSeekerId int primary key identity,
JobSeekerName varchar(50),
JobSeekerEmail varchar(50),
JobSeekerPassword varchar(50),
JobSeekerGender int,
JobSeekerJobProfile int,
JobSeekerQualification int,
JobSeekerState int,
JobSeekerCity int,
JobSeekerAddress varchar(50),
JobSeekerQuestion int,
JobSeekerAnswer varchar(50),
JobSeekerDOB date,
JobSeekerMobile bigint,
JobSeekerExp int,
JobSeekerImage varchar(100),
JobSeekerResume varchar(100),
JobSeekerComments varchar(2000),
JobSeekerInsertedDate date,
JobSeekerStatus int default 0
)

alter procedure Proc_JobSeeker
@action varchar(50)=null,
@JobSeekerId int=0,
@JobSeekerName varchar(50)=null,
@JobSeekerEmail varchar(50)=null,
@JobSeekerPassword varchar(50)=null,
@JobSeekerNewPassword varchar(50)=null,
@JobSeekerCurrentPassword varchar(50)=null,
@JobSeekerGender int=0,
@JobSeekerJobProfile int=0,
@JobSeekerQualification int=0,
@JobSeekerState int=0,
@JobSeekerCity int=0,
@JobSeekerAddress varchar(50)=null,
@JobSeekerQuestion int=0,
@JobSeekerAnswer varchar(50)=null,
@JobSeekerDOB date=null,
@JobSeekerMobile bigint=0,
@JobSeekerExp int=0,
@JobSeekerImage varchar(100)=null,
@JobSeekerResume varchar(100)=null,
@JobSeekerComments varchar(2000)=null
AS
BEGIN
	if(@action='INSERT')
		begin
		insert into tblJobSeeker(JobSeekerName,JobSeekerEmail,JobSeekerPassword,JobSeekerGender,JobSeekerJobProfile,JobSeekerQualification,JobSeekerState,JobSeekerCity,
			JobSeekerAddress,JobSeekerMobile,JobSeekerDOB,JobSeekerExp,JobSeekerImage,JobSeekerResume,JobSeekerComments,JobSeekerQuestion,JobSeekerAnswer,JobSeekerInsertedDate)
			values(@JobSeekerName,@JobSeekerEmail,@JobSeekerPassword,@JobSeekerGender,@JobSeekerJobProfile,@JobSeekerQualification,@JobSeekerState,@JobSeekerCity,
			@JobSeekerAddress,@JobSeekerMobile,@JobSeekerDOB,@JobSeekerExp,@JobSeekerImage,@JobSeekerResume,@JobSeekerComments,@JobSeekerQuestion,@JobSeekerAnswer,GETDATE())
		end
		else if(@action='changepwd')
		begin
		Update tblJobSeeker  set JobSeekerPassword= @JobSeekerNewPassword
		where JobSeekerId=@JobSeekerId and JobSeekerPassword=@JobSeekerCurrentPassword
		end

		else if(@action='JobSeekerBlock')
		begin
		declare @s int
		Select @s = JobSeekerStatus FROM tblJobSeeker WHERE JobSeekerId = @JobSeekerId
		
		if(@s=0)
			begin
			update tblJobSeeker set JobSeekerStatus =1 
				where JobSeekerId = JobSeekerId
			end
	else
			begin
			update tblJobSeeker set JobSeekerStatus =0 
				where JobSeekerId = @JobSeekerId
			end 
		end
	
	else if(@action='JobSeekerJoin')
begin
    Select  *from tblJobSeeker
			join tblState on JobSeekerState=StateId
			join tblCity on JobSeekerCity=CityId
		end
end
END



Select * from tblJobRecruiter

create table tblJobRecruiter
(
JobRecruiterId int primary key identity,
JobRecruiterName varchar(50),
JobRecruiterEmail varchar(50),
JobRecruiterPassword varchar(50),
JobRecruiterURL varchar(50),
JobRecruiterState int,
JobRecruiterCity int,
JobRecruiterAddress varchar(50),
JobRecruiterHR varchar(50),
JobRecruiterMobile bigint,
JobRecruiterImage varchar(100),
JobRecruiterComments varchar(2000),
JobRecruiterInsertedDate date,
JobRecruiterStatus int default 0
)

alter procedure proc_JobRecruiter
@action varchar(50)=null,
@JobRecruiterId int=0,
@JobRecruiterName varchar(50)=null,
@JobRecruiterEmail varchar(50)=null,
@JobRecruiterPassword varchar(50)=null,
@JobRecruiterNewPassword varchar(50)=null,
@JobRecruiterCurrentPassword varchar(50)=null,
@JobRecruiterURL varchar(50)=null,
@JobRecruiterState int=0,
@JobRecruiterCity int=0,
@JobRecruiterAddress varchar(50)=null,
@JobRecruiterHR varchar(50)=null,
@JobRecruiterMobile bigint=0,
@JobRecruiterImage varchar(100)=null,
@JobRecruiterComments varchar(2000)=null
AS
BEGIN
	if(@action='INSERT')
		begin
			insert into tblJobRecruiter(JobRecruiterName,JobRecruiterEmail,JobRecruiterPassword,JobRecruiterURL,JobRecruiterState,JobRecruiterCity,JobRecruiterAddress,JobRecruiterHR,JobRecruiterMobile,JobRecruiterImage,JobRecruiterComments,JobRecruiterInsertedDate)
			values(@JobRecruiterName,@JobRecruiterEmail,@JobRecruiterPassword,@JobRecruiterURL,@JobRecruiterState,@JobRecruiterCity,@JobRecruiterAddress,@JobRecruiterHR,@JobRecruiterMobile,@JobRecruiterImage,@JobRecruiterComments,GETDATE())
		end
		else if(@action='JobRecruierJoin')
		begin
				Select  *from tblJobRecruiter 
			join tblState on JobRecruiterState=StateId
			join tblCity on JobRecruiterCity=CityId
		end

		else if(@action='JobRecruiterBlock')
		begin
		declare @p int
		Select @p = JobRecruiterStatus FROM tblJobRecruiter WHERE JobRecruiterId = @JobRecruiterId
		
		if(@p=0)
			begin
			update tblJobRecruiter set JobRecruiterStatus =1 
				where JobRecruiterId = @JobRecruiterId
			end
	else
			begin
			update tblJobRecruiter set JobRecruiterStatus =0 
				where JobRecruiterId = @JobRecruiterId
			end 
		end
		else if(@action='changepwd')
		begin
		Update tblJobRecruiter  set JobRecruiterPassword= @JobRecruiterNewPassword
		where JobRecruiterId=@JobRecruiterId and JobRecruiterPassword=@JobRecruiterCurrentPassword
		end
END





create table tblJobPost
(
JobPostId int primary key identity,
JobRecruiterId int,
JobPostJobProfileId varchar(50),
JobPostMode int,
JobPostGender int,
JobPostQualifications varchar(100),
JobPostMinExp int,
JobPostmaxExp int,
JobPostMinSalary int,
JobPostMaxsalary int,
JobPostVacancy int,
JobPostComments varchar(2000),
JobPostInsertedDate date,
JobPostStatus int default 0
)

 alter procedure proc_JobPost 
 @action varchar(50)=null, 
 @JobPostId int=0, 
 @JobRecruiterId int=0, 
 @JobPostJobProfileId varchar(50)=0, 
 @JobPostMode int=0, 
 @JobPostGender int=0, 
 @JobPostQualifications varchar(100)=null, 
 @JobPostMinExp int=0, 
 @JobPostmaxExp int=0, 
 @JobPostMinSalary int=0, 
 @JobPostMaxsalary int=0, 
 @JobPostVacancy int=0, 
 @JobPostComments varchar(2000)=null 
 AS BEGIN  
 if(@action='INSERT')   
	begin    
		insert into tblJobPost(JobRecruiterId,JobPostJobProfileId,JobPostMode,JobPostGender,JobPostQualifications,JobPostMinExp,JobPostMaxExp,JobPostMinSalary,JobPostMaxSalary,JobPostVacancy,JobPostComments,JobPostInsertedDate)    
		values(@JobRecruiterId,@JobPostJobProfileId,@JobPostMode,@JobPostGender,@JobPostQualifications,@JobPostMinExp,@JobPostMaxExp,@JobPostMinSalary,@JobPostMaxSalary,@JobPostVacancy,@JobPostComments,GETDATE())   
	end  
	else if(@action='UPDATE')
		begin
		UPDATE tblJobPost SET JobPostJobProfileId = @JobPostJobProfileId, JobPostMode = @JobPostMode, JobPostGender = @JobPostGender, JobPostQualifications = @JobPostQualifications, JobPostMinExp = @JobPostMinExp, JobPostMaxExp = @JobPostMaxExp, JobPostMinSalary = @JobPostMinSalary, JobPostMaxSalary = @JobPostMaxSalary, JobPostVacancy = @JobPostVacancy, JobPostComments = @JobPostComments WHERE JobPostId = @JobPostId
		end
	else if(@action='DELETE')   
	begin    
		delete from tblJobPost where JobPostId=@JobPostId   
	end  
	else if(@action='EDIT')   
	begin    
		Select* from tblJobPost where JobPostId=@JobPostId   
	end  
else if(@action='JOINJOBPOST')   
	begin    
		select * from tblJobPost 
		join tblJobRecruiter on tblJobPost.JobRecruiterId=tblJobRecruiter.JobRecruiterId
		join tblJobProfile on tblJobPost.JobPostJobProfileId=tblJobProfile.JobProfileId
		where tblJobPost.JobRecruiterId=@JobRecruiterId
	end

	else if(@action='JOINJOBPOSTALL')   
	begin    
		select * from tblJobPost 
		join tblJobRecruiter on tblJobPost.JobRecruiterId=tblJobRecruiter.JobRecruiterId
		join tblJobProfile on tblJobPost.JobPostJobProfileId=tblJobProfile.JobProfileId
	end
	else if(@action='JOINJOBPOSTALLACTIVE')   
	begin    
		select * from tblJobPost 
		join tblJobRecruiter on tblJobPost.JobRecruiterId=tblJobRecruiter.JobRecruiterId
		join tblJobProfile on tblJobPost.JobPostJobProfileId=tblJobProfile.JobProfileId 
		where JobPostStatus=0
		
	end
	else if(@action='JOBPOSTSEARCH')   
	begin    
		select * from tblJobPost 
		join tblJobRecruiter on tblJobPost.JobRecruiterId=tblJobRecruiter.JobRecruiterId
		join tblJobProfile on tblJobPost.JobPostJobProfileId=tblJobProfile.JobProfileId
		where JobPostJobProfileId=@JobPostJobProfileId  
		And JobPostStatus=0
	end
END

select * from tblJobPost
truncate table tblJobPost