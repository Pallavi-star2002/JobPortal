<%@ Page Title="Job Seeker Registration" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="JobSeeker_Registration.aspx.cs" Inherits="Job_Portal.JobSeeker_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background: linear-gradient(to right, #4facfe, #00f2fe);
            font-family: 'Segoe UI', sans-serif;
        }

        .creative-form {
            background: #fff;
            border-radius: 20px;
            padding: 40px;
            width: 85%;
            margin: 50px auto;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }

        .form-title {
            text-align: center;
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 30px;
            color: #333;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-bottom: 25px;
        }

        .form-group {
            flex: 0 0 48%;
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            font-weight: 600;
            margin-bottom: 6px;
            color: #444;
        }

        .form-group input,
        .form-group textarea,
        .form-group select {
            padding: 10px 15px;
            border: 1px solid #ccc;
            border-radius: 10px;
            outline: none;
            font-size: 14px;
            transition: 0.3s ease;
        }

        .form-group input:focus,
        .form-group textarea:focus,
        .form-group select:focus {
            border-color: #4facfe;
            box-shadow: 0 0 8px rgba(79, 172, 254, 0.2);
        }

        .form-group textarea {
            resize: vertical;
        }

        .radio-group {
            display: flex;
            gap: 10px;
            align-items: center;
        }

        .form-actions {
            text-align: center;
            margin-top: 30px;
        }

        .form-actions .btn-submit {
            padding: 12px 30px;
            font-size: 16px;
            border: none;
            background-color: #4facfe;
            color: white;
            border-radius: 50px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .form-actions .btn-submit:hover {
            background-color: #00c6ff;
        }

        @media screen and (max-width: 768px) {
            .form-group {
                flex: 0 0 100%;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="creative-form">
        <h2 class="form-title">Job Seeker Registration</h2>


        <div class="form-row">
            <div class="form-group">
                <label for="txtname">Full Name</label>
                <asp:TextBox ID="txtname" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtemail">Email Address</label>
                <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="txtpassword">Password</label>
                <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtmobile">Mobile Number</label>
                <asp:TextBox ID="txtmobile" runat="server" CssClass="form-control" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="txtdateofbirth">Date of Birth</label>
                <asp:TextBox ID="txtdateofbirth" runat="server" TextMode="Date" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label>Gender</label>
                <asp:RadioButtonList ID="rblgender" runat="server" RepeatDirection="Horizontal" CssClass="radio-group">
                    <asp:ListItem Text="Male" Value="1" />
                    <asp:ListItem Text="Female" Value="2" />
                    <asp:ListItem Text="Others" Value="3" />
                </asp:RadioButtonList>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="ddljobprofile">Job Profile</label>
                <asp:DropDownList ID="ddljobprofile" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="ddlexp">Experience</label>
                <asp:DropDownList ID="ddlexp" runat="server" CssClass="form-control">
                    <asp:ListItem Text="--Select--" Value="0" />
                    <asp:ListItem Text="1 Year" Value="1" />
                    <asp:ListItem Text="2 Years" Value="2" />
                    <asp:ListItem Text="3 Years" Value="3" />
                    <asp:ListItem Text="4 Years" Value="4" />
                    <asp:ListItem Text="5+ Years" Value="5" />
                </asp:DropDownList>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="ddlqualification">Qualification</label>
                <asp:DropDownList ID="ddlqualification" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="ddlstate">State</label>
                <asp:DropDownList ID="ddlstate" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlstate_SelectedIndexChanged" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="ddlcity">City</label>
                <asp:DropDownList ID="ddlcity" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtaddress">Full Address</label>
                <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="fuphoto">Upload Photo</label>
                <asp:FileUpload ID="fuphoto" runat="server" CssClass="form-control" />

            </div>
            <div class="form-group">
                <label for="furesume">Upload Resume</label>
                <asp:FileUpload ID="furesume" runat="server" CssClass="form-control" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="ddlsecurityquestion">Security Question</label>
                <asp:DropDownList ID="ddlsecurityquestion" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtanswer">Answer</label>
                <asp:TextBox ID="txtanswer" runat="server" CssClass="form-control" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-group" style="flex: 1 0 100%;">
                <label for="txtcomments">Additional Comments</label>
                <asp:TextBox ID="txtcomments" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" />
            </div>
        </div>

        <div class="form-actions">
            <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn-submit" OnClick="btnsubmit_Click" />
        </div>
    </div>
</asp:Content>
