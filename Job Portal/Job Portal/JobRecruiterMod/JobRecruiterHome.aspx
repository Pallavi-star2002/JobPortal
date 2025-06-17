<%@ Page Title="" Language="C#" MasterPageFile="~/JobRecruiter.Master" AutoEventWireup="true" CodeBehind="~/JobRecruiterModule/JobRecruiterHome.aspx.cs" Inherits="Job_Portal.JobRecruiter.JobRecruiterHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <table>
        <tr>
            <td>Name :</td>
            <td>
                <asp:Label ID="lblname" runat="server"></asp:Label></td>

            <td>URL :</td>
            <td>
                <asp:Label ID="lblurl" runat="server"></asp:Label></td>
        </tr>

        <tr>
            <td>Email :</td>
            <td>
                <asp:Label ID="lblemail" runat="server"></asp:Label></td>

            <td>Password :</td>
            <td>
                <asp:Label ID="lblpassword" runat="server"></asp:Label></td>
        </tr>

        <tr>
            <td>HR :</td>
            <td>
                <asp:Label ID="lblhr" runat="server"></asp:Label></td>
            <td>Mobile Number :</td>
            <td>
                <asp:Label ID="lblmobile" runat="server"></asp:Label></td>

        </tr>

        <tr>
            <td>State :</td>
            <td>
                <asp:Label ID="lblstate" runat="server"></asp:Label></td>
            <td>City :</td>
            <td><asp:Label ID="lblcity" runat="server"></asp:Label></td>
        </tr>

        <tr>


            <td>Address :</td>
            <td>
                <asp:Label ID="lbladdress" runat="server"></asp:Label></td>
            <td>Comment :</td>
            <td>
                <asp:Label ID="lblcomments" runat="server"></asp:Label></td>
        </tr>

                <tr>


    <td>Inserted Date :</td>
    <td>
        <asp:Label ID="lblinserteddate" runat="server"></asp:Label></td>
    <td>status :</td>
    <td>
        <asp:Label ID="lblstatus" runat="server"></asp:Label></td>
</tr>

        <tr>
            <td>Company Image :</td>
            <td>
                <asp:Label ID="lblimage" runat="server" /></td>


            <td></td>
            <td>
                <asp:Button ID="btnsubmit" runat="server" Text="Submit"/></td>
        </tr>
    </table>
</asp:Content>
