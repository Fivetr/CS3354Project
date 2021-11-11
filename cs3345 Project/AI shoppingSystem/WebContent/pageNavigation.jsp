<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style/navigation-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <br>
    <div class="navigation">
            <h2>Online Shopping System</h2>
            <%String userID = session.getAttribute("UserID").toString(); %>
            <a href=""><% out.print(userID + " "); %><i class='fas fa-user-alt'></i></a>
            <a href="home.jsp"><i class="fa fa-home"></i></a>
            <a href="cart.jsp"><i class='fas fa-cart-arrow-down'></i></a>
            <a href="logout.jsp" style="float:right;text-align:right" ><i class="fas fa-sign-out-alt"></i></a>
            <div class="search">
            <form action="search.jsp" method = "post">
            <input type = "text" placeholder = "Search Item Name" name = "search">
            <button type = "submit"><i class="fa fa-search"></i></button>
            </form>            
            </div>
    </div>
    <br>
