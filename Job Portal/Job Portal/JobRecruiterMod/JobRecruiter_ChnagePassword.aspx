<%@ Page Title="" Language="C#" MasterPageFile="~/JobRecruiter.Master" AutoEventWireup="true" CodeBehind="JobRecruiter_ChnagePassword.aspx.cs" Inherits="Job_Portal.JobRecruiterMod.JobRecruiter_ChnagePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <table>
        
        <tr>
            <td>Old Password:-</td>
            <td><asp:TextBox ID="txtoldpwd" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td>New Password:-</td>
            <td><asp:TextBox ID="txtnewpwd" runat="server"></asp:TextBox></td>
        </tr>

            <tr>
            <td>Confirm Password:-</td>
            <td><asp:TextBox ID="txtconfirmpwd" runat="server"></asp:TextBox></td>
        </tr>
     

        <tr>
    <td></td>
    <td><asp:Button ID="chngpwd" runat="server" Text="Change Password" OnClick="chngpwd_Click"/></td>
</tr>

        <tr>
    <td></td>
    <td><asp:Label ID="lblmsg" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label></td>
</tr>
    </table>
</asp:Content>
