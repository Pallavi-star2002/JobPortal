<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeeker.Master" AutoEventWireup="true" CodeBehind="JobSeekersHome.aspx.cs" Inherits="Job_Portal.JobSeekers.JobSeekersHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .profile-container {
            max-width: 800px;
            margin: 20px auto;
            background: #fff;
            box-shadow: 0 1px 4px rgba(0,0,0,0.1);
            border-radius: 8px;
            display: flex;
            gap: 20px;
            padding: 10px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            flex-wrap:wrap;

        }

        .profile-photo {
            flex: 0 0 180px;
            max-width: 180px;
            border-radius: 8px;
            overflow: hidden;
            border: 2px solid #0078d7;
            height: 180px;
        }
        .profile-photo img {
            width: 100%;
            height: 100%;
            object-fit:cover;
            display: block;
        }

        .profile-details {
            flex: 1 1 400px;
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .detail-row {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .detail-label {
            flex: 0 0 140px;
            font-weight: 600;
            color: #333;
        }

        .detail-value {
            flex: 1 1 200px;
            color: #555;
            word-wrap: break-word;
        }

        /* Full width for comment */
        .detail-row.comment-row .detail-value {
            flex: 1 1 100%;
            background: #f5f5f5;
            padding: 8px 12px;
            border-radius: 5px;
            min-height: 60px;
        }

        /* Submit button container */
        .submit-container {
            margin-top: 20px;
            text-align: right;
        }
        .submit-container asp\:Button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #0078d7;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .submit-container asp\:Button:hover {
            background-color: #005a9e;
        }

        /* Responsive: stack photo and details on small screens */
        @media (max-width: 600px) {
            .profile-container {
                flex-direction: column;
                padding: 15px;
            }
            .profile-photo {
                margin: 0 auto 20px;
                height: 150px;
                width: 150px;
            }
            .detail-label {
                flex: 0 0 120px;
            }
        }
    </style>

    <div class="profile-container">

        <div class="profile-photo">
    <div class="detail-label"></div>
    <div class="detail-value">
        <asp:Image ID="imgPhoto" runat="server" Width="150" Height="150"/>

    </div>
</div>
           

        <div class="profile-details">
            <div class="detail-row">
                <div class="detail-label">Name:</div>
                <div class="detail-value"><asp:Label ID="lblname" runat="server" /></div>
            </div>

            <div class="detail-row">
                <div class="detail-label">Email:</div>
                <div class="detail-value"><asp:Label ID="lblemail" runat="server" /></div>
            </div>


             <div class="detail-row">
     <div class="detail-label">Password:</div>
     <div class="detail-value"><asp:Label ID="lblpassword" runat="server" /></div>
 </div>

            <div class="detail-row">
                <div class="detail-label">Mobile Number:</div>
                <div class="detail-value"><asp:Label ID="lblmobile" runat="server" /></div>
            </div>

            <div class="detail-row">
                <div class="detail-label">Date of Birth:</div>
                <div class="detail-value"><asp:Label ID="lbldateofbirth" runat="server" /></div>
            </div>

            <div class="detail-row">
                <div class="detail-label">Gender:</div>
                <div class="detail-value"><asp:Label ID="lblgender" runat="server" /></div>
            </div>

            <div class="detail-row">
                <div class="detail-label">Job Profile:</div>
                <div class="detail-value"><asp:Label ID="lbljobprofile" runat="server" /></div>
            </div>

            <div class="detail-row">
                <div class="detail-label">Job Experience:</div>
                <div class="detail-value"><asp:Label ID="lblexp" runat="server" /></div>
            </div>

            <div class="detail-row">
                <div class="detail-label">Qualification:</div>
                <div class="detail-value"><asp:Label ID="lblqualification" runat="server" /></div>
            </div>

            <div class="detail-row">
                <div class="detail-label">State:</div>
                <div class="detail-value"><asp:Label ID="lblstate" runat="server" /></div>
            </div>

            <div class="detail-row">
                <div class="detail-label">City:</div>
                <div class="detail-value"><asp:Label ID="lblcity" runat="server" /></div>
            </div>

            <div class="detail-row">
                <div class="detail-label">Address:</div>
                <div class="detail-value"><asp:Label ID="lbladdress" runat="server" /></div>
            </div>

            
           

            <div class="detail-row">
                <div class="detail-label">Resume Upload:</div>
                <div class="detail-value"><asp:Label ID="lblresume" runat="server" /></div>
            </div>

            <div class="detail-row">
                <div class="detail-label">Security Question:</div>
                <div class="detail-value"><asp:Label ID="lblecurityquestion" runat="server" /></div>
            </div>

            <div class="detail-row">
                <div class="detail-label">Answer:</div>
                <div class="detail-value"><asp:Label ID="lblanswer" runat="server" /></div>
            </div>

            <div class="detail-row">
                <div class="detail-label">Inserted Date:</div>
                <div class="detail-value"><asp:Label ID="lbldateinsert" runat="server" /></div>
            </div>

            <div class="detail-row">
                <div class="detail-label">Status:</div>
                <div class="detail-value"><asp:Label ID="lblstatus" runat="server" /></div>
            </div>

            <div class="detail-row comment-row">
                <div class="detail-label">Comment:</div>
                <div class="detail-value"><asp:Label ID="lblcomments" runat="server" /></div>
            </div>

            <div class="submit-container">
                <asp:Button ID="btnsubmit" runat="server" Text="Submit" />
            </div>
        </div>
    </div>
</asp:Content>
