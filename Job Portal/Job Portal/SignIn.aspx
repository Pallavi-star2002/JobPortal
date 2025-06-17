<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="Job_Portal.SignIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table>
     <tr>   
        <td>UserType:-</td>
    <td><asp:DropDownList ID="ddlusertype" runat="server">
                     <asp:listitem Text="----Select----" Value="0"></asp:listitem>
                     <asp:listitem Text="ADMIN" Value="1"></asp:listitem>
                    <asp:listitem Text="JOBSEEKERS" Value="2"></asp:listitem>
                         <asp:listitem Text="JOBRECRUITER" Value="3"></asp:listitem>           
        </asp:DropDownList>
</td>
</tr>
        
        <tr>
            <td>Email ID:-</td>
            <td><asp:TextBox ID="txtemail" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td>Password:-</td>
            <td><asp:TextBox ID="txtpassword" runat="server"></asp:TextBox></td>
        </tr>
     
    

        <tr>
    <td></td>
    <td><asp:Button ID="signin" runat="server" Text="Submit" OnClick="signin_Click"/></td>
</tr>

        <tr>
    <td></td>
    <td><asp:Label ID="lblmsg" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label></td>
</tr>
    </table>
</asp:Content>
