<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    display: flex;
    align-items: center;
    height: 100vh;
    background: #fefefe;
}
a {
    outline: 0;
    text-decoration: none;
}
.navigation {
    width: 100%;
    border-bottom: 3px solid #ccd7d7;
    font-family: 'Pathway Gothic One', sans-serif;
    font-size: 22px;
}
.menu {
    display: flex;
    justify-content: center;
    max-width: 1150px;
    margin: 0 auto;
    padding-left: 0;
}
.menu__item {
    display: inline-block;
    white-space: nowrap;
}
@media screen and (max-width: 480px) {
    .menu__item:nth-child(n + 3) {
        display: none;
    }
    .menu__item:nth-child(2) .menu__link {
        border-right: 0;
    }
}
@media screen and (max-width: 768px) {
    .menu__item:nth-child(n + 4) {
        display: none;
    }
    .menu__item:nth-child(3) .menu__link {
        border-right: 0;
    }
}
@media screen and (max-width: 992px) {
    .menu__item:nth-child(n + 5) {
        display: none;
    }
    .menu__item:nth-child(4) .menu__link {
        border-right: 0;
    }
}
.menu__item:last-child .menu__link {
    border-right: 0;
}
.menu__link {
    display: block;
    padding: 6px 30px 3px;
    border-right: 2px dotted #ccd7d7;
}
.menu__link:hover .menu__first-word, .menu__link:focus .menu__first-word {
    transform: translate3d(0, -105%, 0);
}
.menu__link:hover .menu__second-word, .menu__link:focus .menu__second-word {
    transform: translate3d(0, 105%, 0);
}
@media screen and (min-width: 768px) {
    .menu__link {
        padding: 6px 40px 3px;
    }
}
.menu__title {
    display: inline-block;
    overflow: hidden;
}
.menu__first-word, .menu__second-word {
    display: inline-block;
    position: relative;
    transition: transform .3s;
}
.menu__first-word::before, .menu__second-word::before {
    position: absolute;
    content: attr(data-hover);
}
.menu__first-word {
    color: #0c8040;
}
.menu__first-word::before {
    top: 105%;
    color: #626262;
}
.menu__second-word {
    color: #626262;
}
.menu__second-word::before {
    bottom: 105%;
    color: #0c8040;
}
</style>
</head>
<body>
<nav class="navigation">
  <ul class="menu">
    <li class="menu__item">
      <a href="#" class="menu__link">
        <span class="menu__title">
          <span class="menu__first-word" data-hover="About">
            About
          </span>
          <span class="menu__second-word" data-hover="Us">
            Us
          </span>
        </span>
      </a>
    </li>

    <li class="menu__item">
      <a href="#" class="menu__link">
        <span class="menu__title">
          <span class="menu__first-word" data-hover="M">
           M
          </span>
          <span class="menu__second-word" data-hover="AN">
           AN
          </span>
        </span>
      </a>
    </li>

    <li class="menu__item">
      <a href="#" class="menu__link">
        <span class="menu__title">
          <span class="menu__first-word" data-hover="Latest">
            Latest
          </span>
          <span class="menu__second-word" data-hover="News">
            News
          </span>
        </span>
      </a>
    </li>

    <li class="menu__item">
      <a href="#" class="menu__link">
        <span class="menu__title">
          <span class="menu__first-word" data-hover="New">
            New
          </span>
          <span class="menu__second-word" data-hover="Arrivals">
            Arrivals
          </span>
        </span>
      </a>
    </li>

    <li class="menu__item">
      <a href="#" class="menu__link">
        <span class="menu__title">
          <span class="menu__first-word" data-hover="On">
            On
          </span>
          <span class="menu__second-word" data-hover="Sale">
            Sale
          </span>
        </span>
      </a>
    </li>

    <li class="menu__item">
      <a href="#" class="menu__link">
        <span class="menu__title">
          <span class="menu__first-word" data-hover="Contact">
            Contact
          </span>
          <span class="menu__second-word" data-hover="Us">
            Us
          </span>
        </span>
      </a>
    </li>
  </ul>
</nav>
</body>
</html>