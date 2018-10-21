<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>해피빈</title>
<link rel="shortcut icon"
	href="https://ssl.pstatic.net/happyimg2/img/favicon.ico"
	type="image/x-icon">

<style>
.api_ly .api_thum, .api_ly .ly_clse, .api_ly .btn_give span,
	.ly_personal .cont .btn_green, .ly_personal .notice:before,
	.ly_personal .btn_pop_clse {
	background-image:
		url(https://ssl.pstatic.net/happyimg2/img/pc/sp_hb_legacy_9af2d980.png);
	background-size: 256px 95px
}

.collection_box_banner .point2:after, .more_white:after, .more:after,
	.happybean_logo, .user_area[aria-pressed='true'] .user_id:before,
	.user_id:before, .header_lnb_item .label_on, .slider_banner_previous:before,
	.slider_banner_next:before, .theme_simple_icon0, .theme_simple_icon3,
	.theme_simple_icon4, .theme_simple_icon5, .theme_simple_icon6,
	.theme_simple_icon7, .theme_simple_icon8, .theme_simple_icon9,
	.theme_simple_icon10, .theme_simple_icon11, .theme_simple_icon12,
	.icon_people, .icon_money, .card_good .icon_x, .icon_bean,
	.icon_delivery, .icon_commission, .card_product_agent:before,
	.theme_icon0, .theme_icon3, .theme_icon4, .theme_icon5, .theme_icon6,
	.theme_icon7, .theme_icon8, .theme_icon9, .theme_icon10, .theme_icon11,
	.theme_icon12, .category_support_link:before,
	.category_support_previous:before, .category_support_next:before,
	.sorting_area .sorting_button:after, .sorting_area_stretch .sorting_button:after,
	.checkbox_area .checkbox_input.is_checked+.checkbox_label:after,
	.sorting_area2 .sorting_button:after, .double_sorting_year .sorting_button:after,
	.theme_icon_big3, .theme_icon_big4, .theme_icon_big5, .theme_icon_big6,
	.theme_icon_big7, .theme_icon_big8, .theme_icon_big9, .theme_icon_big10,
	.theme_icon_big11, .theme_icon_big12, .double_chart_previous:before,
	.double_chart_next:before, .store_banner_previous:before,
	.store_banner_next:before, .btn_service_info:after, .notice_wrap .icon_new,
	.btn_mobile .icon_arrow {
	background-image:
		url(https://ssl.pstatic.net/happyimg2/img/pc/sp_hb_svg_ce6872ab.png);
	background-image: -webkit-gradient(linear, left top, left bottom, from(transparent),
		to(transparent)),
		url(https://ssl.pstatic.net/happyimg2/img/pc/sp_hb_svg_b46450d1.svg);
	background-image: linear-gradient(transparent, transparent),
		url(https://ssl.pstatic.net/happyimg2/img/pc/sp_hb_svg_b46450d1.svg);
	background-size: 634px 621px
}

body, p, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, table, th, td,
	form, fieldset, legend, input, textarea, button, select {
	margin: 0;
	padding: 0
}

body, input, textarea, select, button, table {
	font-family: NanumBarunGothic, Sans-serif;
	font-size: 14px;
	line-height: 19px;
	color: #202020
}

body {
	position: relative;
	-webkit-font-smoothing: antialiased
}

img, fieldset {
	border: 0
}

ul, ol {
	list-style: none
}

em, address {
	font-style: normal
}

a {
	text-decoration: none;
	color: inherit
}

table {
	border-collapse: collapse
}

i {
	font-style: normal
}

*, *:before, *:after {
	-webkit-box-sizing: border-box;
	box-sizing: border-box
}

input, textarea, select, button {
	border: 0;
	border-radius: 0;
	background-color: transparent;
	-webkit-box-shadow: none;
	box-shadow: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none
}

button, input[type='button'], input[type='reset'], input[type='submit'],
	input[type='checkbox']+label, input[type='radio']+label {
	cursor: pointer
}

input[type='checkbox']:focus+label {
	outline: -webkit-focus-ring-color auto 5px
}

input[type='checkbox'], input[type='radio'], .blind {
	overflow: hidden;
	position: absolute;
	width: 1px;
	height: 1px;
	margin: -1px;
	clip: rect(0, 0, 0, 0)
}

@font-face {
	font-family: NanumSquareWebFont;
	font-style: normal;
	font-weight: normal;
	src: url(https://ssl.pstatic.net/happyimg2/font/NanumSquareR.eot);
	src: local(☺),
		url(https://ssl.pstatic.net/happyimg2/font/NanumSquareR.woff2)
		format("woff2"),
		url(https://ssl.pstatic.net/happyimg2/font/NanumSquareR.woff)
		format("woff"),
		url(https://ssl.pstatic.net/happyimg2/font/NanumSquareR.ttf)
		format("truetype")
}

@font-face {
	font-family: NanumSquareWebFont;
	font-style: normal;
	font-weight: bold;
	src: url(https://ssl.pstatic.net/happyimg2/font/NanumSquareB.eot);
	src: local(☺),
		url(https://ssl.pstatic.net/happyimg2/font/NanumSquareB.woff2)
		format("woff2"),
		url(https://ssl.pstatic.net/happyimg2/font/NanumSquareB.woff)
		format("woff"),
		url(https://ssl.pstatic.net/happyimg2/font/NanumSquareB.ttf)
		format("truetype")
}

@font-face {
	font-family: NanumBarunGothic;
	font-style: normal;
	font-weight: 300;
	src: url(https://ssl.pstatic.net/happyimg2/font/NBarunGothicLight.eot);
	src: local(☺),
		url(https://ssl.pstatic.net/happyimg2/font/NBarunGothicLight.woff2)
		format("woff2"),
		url(https://ssl.pstatic.net/happyimg2/font/NBarunGothicLight.woff)
		format("woff"),
		url(https://ssl.pstatic.net/happyimg2/font/NBarunGothicLight.ttf)
		format("truetype")
}

@font-face {
	font-family: NanumBarunGothic;
	font-style: normal;
	font-weight: normal;
	src: url(https://ssl.pstatic.net/happyimg2/font/NBarunGothic.eot);
	src: local(☺),
		url(https://ssl.pstatic.net/happyimg2/font/NBarunGothic.woff2)
		format("woff2"),
		url(https://ssl.pstatic.net/happyimg2/font/NBarunGothic.woff)
		format("woff"),
		url(https://ssl.pstatic.net/happyimg2/font/NBarunGothic.ttf)
		format("truetype")
}

@font-face {
	font-family: NanumBarunGothic;
	font-style: normal;
	font-weight: bold;
	src: url(https://ssl.pstatic.net/happyimg2/font/NBarunGothicBold.eot);
	src: local(☺),
		url(https://ssl.pstatic.net/happyimg2/font/NBarunGothicBold.woff2)
		format("woff2"),
		url(https://ssl.pstatic.net/happyimg2/font/NBarunGothicBold.woff)
		format("woff"),
		url(https://ssl.pstatic.net/happyimg2/font/NBarunGothicBold.ttf)
		format("truetype")
}

[aria-hidden='true'] {
	display: none
}

.u_skip {
	position: relative
}

.u_skip a {
	position: absolute;
	top: -30px;
	left: 0;
	width: 138px;
	border: 1px solid #4ec53d;
	background: #333;
	text-align: center
}

.u_skip a:active, .u_skip a:focus {
	top: 0;
	z-index: 1000;
	text-decoration: none
}

.u_skip span {
	display: inline-block;
	padding: 2px 6px 0 0;
	font-size: 13px;
	line-height: 26px;
	letter-spacing: -1px;
	color: #fff
}

.wrap {
	min-width: 1140px
}

.content {
	width: 1140px;
	margin: 60px auto 0
}

.epilogue_content {
	width: 1140px;
	margin: 50px auto 0
}

.fund_epilogue_content {
	width: 1140px;
	margin: 60px auto 0
}

.home_content .event_banner {
	width: 100%;
	margin-top: 60px
}

.home_content .event_banner:before {
	border-width: 1px 0
}

.home_content+.footer {
	margin-top: 0
}

.card_wrap {
	width: 1164px;
	margin: 12px 0 -24px -24px;
	clear: both
}

.card_wrap:after {
	display: table;
	table-layout: fixed;
	clear: both;
	content: ''
}

.card_store_wrap {
	width: 1164px;
	margin: 28px 0 -24px -24px;
	clear: both
}

.card_store_wrap:after {
	display: table;
	table-layout: fixed;
	clear: both;
	content: ''
}

.donation_card_wrap, .double_card_wrap {
	width: 1140px;
	clear: both
}

.donation_card_wrap:after, .double_card_wrap:after {
	display: table;
	table-layout: fixed;
	clear: both;
	content: ''
}

.donation_card_wrap {
	margin: 40px auto -24px
}

.double_card_wrap {
	margin: 24px auto -24px
}

.funding_card_wrap {
	width: 1140px;
	margin: 60px auto -24px;
	clear: both
}

.funding_card_wrap:after {
	display: table;
	table-layout: fixed;
	clear: both;
	content: ''
}

.funding_card_inner:after {
	display: table;
	table-layout: fixed;
	clear: both;
	content: ''
}

.funding_card_inner+.funding_card_inner .card_funding:first-child {
	margin-left: 0
}

.good_card_wrap {
	margin-top: 60px;
	background-color: #f6f6f6
}

.good_card_inner {
	position: relative;
	width: 1140px;
	margin: 0 auto;
	padding: 51px 0 36px
}

.good_card_inner .more {
	position: absolute;
	top: 128px;
	right: 0
}

.campaign_card_wrap {
	position: relative;
	width: 1140px;
	margin: 0 auto;
	padding: 50px 0 60px
}

.campaign_card_wrap .more {
	position: absolute;
	top: 128px;
	right: 0
}

.btn_horizontal_more {
	display: block;
	width: 100%;
	margin-top: 30px;
	clear: both;
	border: 1px solid #e5e5e5;
	background-color: #f6f6f6;
	line-height: 51px;
	color: #333
}

.event_banner {
	display: block;
	position: relative;
	width: 1140px;
	margin: 48px auto 0;
	text-align: center
}

.event_banner:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	border: 1px solid rgba(0, 0, 0, 0.03);
	content: ''
}

.event_banner .event_banner_img {
	vertical-align: top
}

.collection_box_banner {
	display: block;
	width: 1140px;
	height: 80px;
	margin: 50px auto 0;
	border: 1px solid #e5e5e5;
	background-color: #f6f6f6;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 18px;
	line-height: 22px;
	letter-spacing: -0.4px;
	text-align: center
}

.collection_box_banner:before {
	display: inline-block;
	height: 100%;
	vertical-align: middle;
	content: ''
}

.collection_box_banner .text {
	vertical-align: middle
}

.collection_box_banner .point {
	color: #00ab33
}

.collection_box_banner .point2 {
	margin-left: 6px;
	font-size: 17px;
	line-height: 20px;
	letter-spacing: -0.5px;
	vertical-align: middle;
	color: #00ab33
}

.collection_box_banner .point2:after {
	background-position: -254px -560px;
	width: 7px;
	height: 11px;
	display: inline-block;
	margin-left: 4px;
	content: ''
}

.collection_box_banner+.fund_epilogue_content {
	margin-top: 36px
}

.more_white {
	display: inline-block;
	position: relative;
	padding-right: 12px;
	opacity: 0.8
}

.more_white:after {
	background-position: -269px -560px;
	width: 6px;
	height: 11px;
	position: absolute;
	top: 50%;
	right: 0;
	margin-top: -7px;
	content: ''
}

.more {
	display: inline-block;
	position: relative;
	padding-right: 12px;
	opacity: 0.8
}

.more:after {
	background-position: -223px -560px;
	width: 6px;
	height: 11px;
	position: absolute;
	top: 50%;
	right: 0;
	margin-top: -7px;
	content: ''
}

.content_notice_text {
	margin-top: 12px;
	padding: 164px 0;
	border: 1px solid #ededed;
	font-size: 20px;
	line-height: 24px;
	text-align: center;
	color: #828282
}

.content_notice_text .point {
	font-family: HelveticaNeue, NanumBarunGothic, Sans-serif;
	color: #00ab33
}

.content_notice_text .point:before {
	content: '\2018'
}

.content_notice_text .point:after {
	content: '\2019'
}

.store_tab {
	font-size: 0;
	text-align: center
}

.store_tab_item {
	position: relative;
	padding: 0 20px;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 24px;
	font-weight: bold;
	line-height: 28px;
	letter-spacing: -0.5px
}

.store_tab_item[aria-selected='false'] {
	color: #909090
}

.store_tab_item+.store_tab_item {
	padding-left: 21px
}

.store_tab_item+.store_tab_item:before {
	position: absolute;
	top: 50%;
	left: 0;
	width: 1px;
	height: 20px;
	margin-top: -10px;
	background-color: #e4e4e4;
	content: ''
}

.is-scroll {
	padding-top: 70px
}

.is-scroll .header_gnb {
	position: fixed;
	top: 0;
	right: 0;
	left: 0;
	z-index: 30;
	border-bottom: 1px solid #e8e8e8
}

.header_gnb {
	background-color: #fff
}

.header_gnb_inner {
	position: relative;
	width: 1140px;
	height: 70px;
	margin: 0 auto;
	padding-right: 86px
}

.header_gnb_inner:after {
	display: table;
	table-layout: fixed;
	clear: both;
	content: ''
}

.logo {
	float: left;
	margin-top: 21px
}

.happybean_logo {
	background-position: -376px -128px;
	width: 80px;
	height: 28px;
	display: inline-block;
	vertical-align: top
}

.menu {
	float: left;
	margin: 23px 0 0 289px
}

.menu_item {
	float: left;
	padding: 0 25px;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 20px;
	font-weight: bold;
	line-height: 24px
}

.menu_item[aria-current='true'], .menu_item:hover, .menu_item:focus {
	color: #00ab33
}

.login_wrap {
	float: right;
	position: relative;
	margin-top: 17px
}

.login_wrap:after {
	display: table;
	table-layout: fixed;
	clear: both;
	content: ''
}

.btn_login, .btn_search {
	display: block;
	width: 80px;
	height: 35px;
	border: 1px solid #e1e1e1;
	font-size: 14px;
	line-height: 35px;
	text-align: center;
	color: #333
}

.btn_search {
	position: absolute;
	top: 17px;
	right: 0
}

.user_area {
	display: inline-block;
	margin-right: 10px
}

.user_area[aria-pressed='true'] .user_id:before {
	background-position: -569px -515px;
	width: 11px;
	height: 7px
}

.user_img {
	overflow: hidden;
	width: 34px;
	height: 34px;
	margin-right: 6px;
	border: 1px solid #e0e0e0;
	border-radius: 50%;
	vertical-align: middle
}

.user_id {
	display: inline-block;
	position: relative;
	padding-right: 17px;
	vertical-align: middle
}

.user_id:before {
	background-position: -550px -515px;
	width: 11px;
	height: 7px;
	position: absolute;
	top: 50%;
	right: 0;
	margin-top: -4px;
	content: ''
}

.user_id:after {
	vertical-align: middle;
	content: '\B2D8'
}

.user_id .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	display: inline-block;
	max-width: 180px;
	vertical-align: middle
}

.user_info_area {
	position: absolute;
	top: 52px;
	right: 7px;
	z-index: 10;
	width: 257px;
	border: 1px solid rgba(0, 0, 0, 0.05);
	background-color: #fff
}

.user_info_cash {
	padding: 8px 19px 17px 20px
}

.user_info_line {
	display: block;
	margin-top: 10px;
	color: #333
}

.user_info_line:after {
	display: table;
	table-layout: fixed;
	clear: both;
	content: ''
}

.user_info_line .title {
	float: left
}

.user_info_line .text {
	float: right;
	text-align: right
}

.user_info_line .point {
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 16px;
	font-weight: bold;
	letter-spacing: -0.5px;
	color: #00ab33
}

.user_info_footer {
	font-size: 0
}

.user_info_item {
	display: inline-block;
	width: 50%;
	border-top: 1px solid #e0e0e0;
	font-size: 14px;
	line-height: 38px;
	text-align: center;
	vertical-align: top;
	color: #333
}

.user_info_item:first-child {
	border-right: 1px solid #e0e0e0;
	color: #00ab33
}

.partner_info_area {
	position: absolute;
	top: 52px;
	right: 7px;
	z-index: 10;
	width: 156px;
	border: 1px solid rgba(0, 0, 0, 0.05);
	background-color: #fff
}

.partner_info_area .user_info_item {
	width: 100%;
	border-right: 0;
	color: #333
}

.partner_info_link {
	display: block;
	padding: 13px 0 12px;
	letter-spacing: -0.2px;
	text-align: center;
	color: #333
}

.header_lnb {
	position: relative;
	margin-bottom: -1px;
	border-top: 1px solid #f0f0f0;
	border-bottom: 1px solid rgba(0, 0, 0, 0.12)
}

html[data-user-agent*="MSIE 8.0"] .header_lnb {
	border-bottom: 1px solid #e0e0e0
}

.header_lnb_inner {
	width: 1140px;
	margin: 0 auto;
	font-size: 0;
	text-align: center
}

.header_lnb_item {
	display: inline-block;
	min-width: 146px;
	height: 50px;
	padding: 16px 42px;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 17px;
	text-align: center;
	vertical-align: middle
}

.header_lnb_item[aria-current='true'], .header_lnb_item:hover,
	.header_lnb_item:focus {
	position: relative;
	font-weight: bold;
	color: #00ab33
}

.header_lnb_item[aria-current='true']:before, .header_lnb_item:hover:before,
	.header_lnb_item:focus:before {
	position: absolute;
	right: 38px;
	bottom: 0;
	left: 38px;
	height: 2px;
	background-color: #01d147;
	content: ''
}

.header_lnb_item i {
	display: inline-block;
	width: 23px;
	height: 17px;
	margin-left: 3px;
	vertical-align: middle
}

.header_lnb_item .label_on {
	background-position: -464px -128px;
	width: 23px;
	height: 17px
}

.slider_banner_wrap {
	overflow: hidden;
	position: relative;
	height: 480px
}

.slider_banner_inner {
	height: 100%
}

.slider_banner_list:after {
	display: table;
	table-layout: fixed;
	clear: both;
	content: ''
}

.slider_banner_item {
	float: left;
	width: 1140px;
	height: 480px;
	padding: 0 1px;
	-webkit-box-sizing: content-box;
	box-sizing: content-box
}

.slider_banner_item.is_active .slider_banner_img {
	opacity: 1;
	filter: Alpha(opacity = 100)
}

@media all and (max-width: 1141px) {
	.slider_banner_item {
		padding: 0
	}
}

.slider_banner_content {
	display: inline-block;
	background-color: #000
}

.slider_banner_img {
	opacity: 0.7;
	vertical-align: top;
	filter: Alpha(opacity = 70)
}

.slider_banner_navigator {
	position: absolute;
	right: 0;
	bottom: 20px;
	left: 0;
	font-size: 0;
	line-height: 10px;
	text-align: center
}

.slider_banner_navigator .swiper-pagination-bullet {
	display: inline-block;
	width: 10px;
	height: 10px;
	margin: 0 4px;
	border-radius: 5px;
	background-color: rgba(255, 255, 255, 0.6);
	vertical-align: top
}

html[data-user-agent*="MSIE 8.0"] .slider_banner_navigator .swiper-pagination-bullet
	{
	background-color: #fff
}

.slider_banner_navigator .swiper-pagination-bullet.swiper-pagination-bullet-active
	{
	width: 24px;
	background-color: #00ed6d
}

.slider_banner_previous, .slider_banner_next {
	position: absolute;
	top: 50%;
	width: 44px;
	height: 80px;
	background-color: rgba(0, 0, 0, 0.15)
}

html[data-user-agent*="MSIE 8.0"] .slider_banner_previous, html[data-user-agent*="MSIE 8.0"] .slider_banner_next
	{
	background-color: #d9d9d9
}

html[data-user-agent*="MSIE 8.0"] .slider_banner_previous:before, html[data-user-agent*="MSIE 8.0"] .slider_banner_next:before
	{
	top: 0
}

.slider_banner_previous:before, .slider_banner_next:before {
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -17px 0 0 -9px;
	content: ''
}

.slider_banner_previous {
	right: 50%;
	margin: -40px 526px 0 0
}

.slider_banner_previous:before {
	background-position: -30px -583px;
	width: 18px;
	height: 34px
}

.slider_banner_next {
	left: 50%;
	margin: -40px 0 0 526px
}

.slider_banner_next:before {
	background-position: -4px -583px;
	width: 18px;
	height: 34px
}

.category_simple_wrap {
	width: 1140px;
	margin: 0 auto;
	border-bottom: 1px solid #e8e9ed
}

.category_simple_list {
	overflow: hidden;
	padding: 30px 3px 23px 4px
}

.category_simple_item {
	float: left;
	width: 103px;
	text-align: center
}

.category_simple_link {
	display: block;
	position: relative;
	font-size: 15px
}

.category_simple_link:before {
	display: block;
	width: 62px;
	height: 62px;
	margin: 0 auto 7px;
	border: 1px solid #ebebeb;
	border-radius: 31px;
	content: ''
}

.category_simple_link:hover [class*='theme_simple_icon'],
	.category_simple_link:focus [class*='theme_simple_icon'] {
	background-color: #01d147
}

.category_simple_link:hover:before, .category_simple_link:focus:before {
	border-color: #01c743
}

.category_simple_link:hover .theme_simple_icon0, .category_simple_link:focus .theme_simple_icon0
	{
	background-position: -570px -344px
}

.category_simple_link:hover .theme_simple_icon3, .category_simple_link:focus .theme_simple_icon3
	{
	background-position: -4px -515px
}

.category_simple_link:hover .theme_simple_icon4, .category_simple_link:focus .theme_simple_icon4
	{
	background-position: -140px -515px
}

.category_simple_link:hover .theme_simple_icon5, .category_simple_link:focus .theme_simple_icon5
	{
	background-position: -500px -346px
}

.category_simple_link:hover .theme_simple_icon6, .category_simple_link:focus .theme_simple_icon6
	{
	background-position: -500px -210px
}

.category_simple_link:hover .theme_simple_icon7, .category_simple_link:focus .theme_simple_icon7
	{
	background-position: -500px -74px
}

.category_simple_link:hover .theme_simple_icon8, .category_simple_link:focus .theme_simple_icon8
	{
	background-position: -386px -447px
}

.category_simple_link:hover .theme_simple_icon9, .category_simple_link:focus .theme_simple_icon9
	{
	background-position: -250px -447px
}

.category_simple_link:hover .theme_simple_icon10, .category_simple_link:focus .theme_simple_icon10
	{
	background-position: -72px -447px
}

.category_simple_link:hover .theme_simple_icon11, .category_simple_link:focus .theme_simple_icon11
	{
	background-position: -4px -447px
}

.category_simple_link:hover .theme_simple_icon12, .category_simple_link:focus .theme_simple_icon12
	{
	background-position: -570px -276px
}

[class*='theme_simple_icon'] {
	position: absolute;
	top: 1px;
	left: 50%;
	margin-left: -30px;
	border-radius: 50%;
	background-color: #fafafa
}

.theme_simple_icon0 {
	background-position: -570px -4px;
	width: 60px;
	height: 60px
}

.theme_simple_icon3 {
	background-position: -570px -412px;
	width: 60px;
	height: 60px
}

.theme_simple_icon4 {
	background-position: -72px -515px;
	width: 60px;
	height: 60px
}

.theme_simple_icon5 {
	background-position: -570px -140px;
	width: 60px;
	height: 60px
}

.theme_simple_icon6 {
	background-position: -500px -278px;
	width: 60px;
	height: 60px
}

.theme_simple_icon7 {
	background-position: -500px -142px;
	width: 60px;
	height: 60px
}

.theme_simple_icon8 {
	background-position: -454px -447px;
	width: 60px;
	height: 60px
}

.theme_simple_icon9 {
	background-position: -318px -447px;
	width: 60px;
	height: 60px
}

.theme_simple_icon10 {
	background-position: -182px -447px;
	width: 60px;
	height: 60px
}

.theme_simple_icon11 {
	background-position: -570px -72px;
	width: 60px;
	height: 60px
}

.theme_simple_icon12 {
	background-position: -570px -208px;
	width: 60px;
	height: 60px
}

.good_card_title {
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 32px;
	line-height: 34px;
	letter-spacing: -0.5px;
	text-align: center
}

.good_card_text {
	margin-top: 13px;
	font-size: 16px;
	line-height: 21px;
	text-align: center;
	color: #818181
}

.good_card_area {
	position: relative;
	margin-left: -24px;
	padding-top: 38px
}

.good_card_area:after {
	display: table;
	table-layout: fixed;
	clear: both;
	content: ''
}

.campaign_card_title {
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 32px;
	line-height: 34px;
	letter-spacing: -0.5px;
	text-align: center
}

.campaign_card_text {
	margin-top: 14px;
	font-size: 16px;
	line-height: 21px;
	text-align: center;
	color: #858585
}

.campaign_card_area {
	position: relative;
	padding-top: 38px
}

.campaign_card_area:after {
	display: table;
	table-layout: fixed;
	clear: both;
	content: ''
}

.icon_people {
	background-position: -459px -515px;
	width: 19px;
	height: 19px
}

.icon_money {
	background-position: -432px -515px;
	width: 19px;
	height: 19px;
	display: inline-block;
	vertical-align: middle
}

.card_donation {
	float: left;
	width: 267px;
	height: 381px;
	padding: 29px 27px 0;
	border: 1px solid #01b633;
	background-color: #01c838;
	color: #fff
}

.card_donation .label_translucence, .card_donation .label_translucence_long
	{
	display: inline-block;
	background-color: #01a82f;
	font-size: 15px;
	line-height: 30px;
	text-align: center
}

.card_donation .label_translucence {
	width: 70px
}

.card_donation .label_translucence+[class*='label_translucence'] {
	margin-left: 4px
}

.card_donation .label_translucence_long {
	width: 90px
}

.card_donation_htitle {
	display: block;
	margin-top: 21px;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 27px;
	line-height: 37px;
	letter-spacing: -1px;
	text-shadow: 0.5px 0.5px 0 rgba(17, 74, 47, 0.26)
}

.card_donation .more_white {
	margin-top: 18px
}

.card_donation_list {
	margin: 0 -8px;
	padding-left: 8px;
	border-top: 1px solid #01b834;
	font-size: 16px
}

.card_donation_title {
	float: left;
	width: 100px;
	height: 19px;
	margin-top: 11px
}

.card_donation .icon_people, .card_donation .icon_money {
	display: inline-block;
	margin-right: 8px;
	vertical-align: middle
}

.card_donation_number {
	height: 19px;
	margin-top: 11px;
	white-space: nowrap
}

.card_donation_number .point {
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 18px;
	font-weight: bold;
	letter-spacing: -0.2px
}

.card_donation_list {
	margin-top: 57px;
	padding-top: 40px
}

.card_doublehome {
	float: left;
	width: 267px;
	height: 381px;
	padding: 29px 27px 0;
	border: 1px solid #e1980c;
	background-color: #f7a70d;
	color: #fff
}

.card_doublehome .label_translucence, .card_doublehome .label_translucence_long
	{
	display: inline-block;
	background-color: #cf8c0b;
	font-size: 15px;
	line-height: 30px;
	text-align: center
}

.card_doublehome .label_translucence {
	width: 70px
}

.card_doublehome .label_translucence+[class*='label_translucence'] {
	margin-left: 4px
}

.card_doublehome .label_translucence_long {
	width: 90px
}

.card_doublehome_htitle {
	display: block;
	margin-top: 21px;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 27px;
	line-height: 37px;
	letter-spacing: -1px;
	text-shadow: 0.5px 0.5px 0 rgba(17, 74, 47, 0.26)
}

.card_doublehome .more_white {
	margin-top: 18px
}

.card_doublehome_list {
	margin: 0 -8px;
	padding-left: 8px;
	border-top: 1px solid #e39a0c;
	font-size: 16px
}

.card_doublehome_title {
	float: left;
	width: 100px;
	height: 19px;
	margin-top: 11px
}

.card_doublehome .icon_people, .card_doublehome .icon_money {
	display: inline-block;
	margin-right: 8px;
	vertical-align: middle
}

.card_doublehome_number {
	height: 19px;
	margin-top: 11px;
	white-space: nowrap
}

.card_doublehome_number .point {
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 18px;
	font-weight: bold;
	letter-spacing: -0.2px
}

.card_doublehome_list {
	margin-top: 57px;
	padding-top: 40px
}

.card_fundinghome {
	float: left;
	width: 364px;
	height: 356px;
	padding: 29px 27px 0;
	border: 1px solid #1c90e8;
	background-color: #1f9eff;
	color: #fff
}

.card_fundinghome .label_translucence, .card_fundinghome .label_translucence_long
	{
	display: inline-block;
	background-color: #1a85d6;
	font-size: 15px;
	line-height: 30px;
	text-align: center
}

.card_fundinghome .label_translucence {
	width: 70px
}

.card_fundinghome .label_translucence+[class*='label_translucence'] {
	margin-left: 4px
}

.card_fundinghome .label_translucence_long {
	width: 90px
}

.card_fundinghome_htitle {
	display: block;
	margin-top: 21px;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 27px;
	line-height: 37px;
	letter-spacing: -1px;
	text-shadow: 0.5px 0.5px 0 rgba(17, 74, 47, 0.26)
}

.card_fundinghome .more_white {
	margin-top: 18px
}

.card_fundinghome_list {
	margin: 0 -8px;
	padding-left: 8px;
	border-top: 1px solid #1d91eb;
	font-size: 16px
}

.card_fundinghome_title {
	float: left;
	width: 100px;
	height: 19px;
	margin-top: 11px
}

.card_fundinghome .icon_people, .card_fundinghome .icon_money {
	display: inline-block;
	margin-right: 8px;
	vertical-align: middle
}

.card_fundinghome_number {
	height: 19px;
	margin-top: 11px;
	white-space: nowrap
}

.card_fundinghome_number .point {
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 18px;
	font-weight: bold;
	letter-spacing: -0.2px
}

.card_fundinghome_list {
	margin-top: 25px;
	padding-top: 13px
}

.card_funding {
	float: left;
	position: relative;
	width: 364px;
	height: 356px;
	margin: 0 0 24px 24px
}

.card_funding:after {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	border: 1px solid rgba(0, 0, 0, 0.11);
	content: ''
}

html[data-user-agent*="MSIE 8.0"] .card_funding:after {
	border: 1px solid #e3e3e3
}

.card_funding:hover:after, .card_funding:focus:after {
	border-color: rgba(0, 0, 0, 0.35)
}

html[data-user-agent*="MSIE 8.0"] .card_funding:hover:after, html[data-user-agent*="MSIE 8.0"] .card_funding:focus:after
	{
	border: 1px solid #a6a6a6
}

.card_funding .card_funding_img {
	vertical-align: top
}

.card_funding .card_funding_content {
	position: relative;
	padding: 18px 100px 20px 20px
}

.card_funding .card_funding_funder {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	font-size: 15px;
	color: #828282
}

.card_funding .card_funding_funder .category {
	color: #0f92e0
}

.card_funding .card_funding_funder .category:after {
	display: inline-block;
	width: 1px;
	height: 13px;
	margin: -2px 8px 0;
	background-color: #d7d7d7;
	vertical-align: middle;
	content: ''
}

.card_funding .card_funding_title {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	height: 50px;
	line-height: 25px;
	word-wrap: break-word;
	word-break: keep-all;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	margin-top: 6px;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 17px;
	letter-spacing: -0.5px;
	color: #333
}

html[data-user-agent*="Trident"] .card_funding .card_funding_title {
	display: block
}

.card_funding .card_funding_percent {
	position: absolute;
	top: 50%;
	height: 60px;
	margin-top: -30px;
	right: 20px;
	width: 60px;
	border: 1px solid #0f92e0;
	border-radius: 50%;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 18px;
	line-height: 60px;
	letter-spacing: -0.2px;
	text-align: center;
	color: #0f92e0
}

.card_funding .card_funding_percent.is_exceed {
	font-size: 16px;
	letter-spacing: -0.5px
}

.card_funding .card_funding_brand {
	position: absolute;
	top: 50%;
	right: 20px;
	margin-top: -33px;
	border-radius: 50%
}

.card_good {
	float: left;
	position: relative;
	width: 558px;
	height: 207px;
	margin: 0 0 24px 24px;
	background-color: #fff
}

.card_good:hover:after, .card_good:focus:after {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	border: 1px solid rgba(0, 0, 0, 0.35);
	content: ''
}

html[data-user-agent*="MSIE 8.0"] .card_good:hover:after, html[data-user-agent*="MSIE 8.0"] .card_good:focus:after
	{
	border: 1px solid #a6a6a6
}

.card_good .card_good_img {
	float: left;
	vertical-align: top
}

.card_good .card_good_content {
	display: block;
	overflow: hidden;
	padding: 51px 20px 0
}

.card_good .card_good_category {
	display: block;
	font-size: 15px;
	line-height: 20px;
	letter-spacing: -0.5px;
	color: #9354fb
}

.card_good .icon_x {
	background-position: -283px -560px;
	width: 10px;
	height: 10px;
	display: inline-block;
	margin: 0 4px
}

.card_good .card_good_title {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	max-height: 56px;
	line-height: 28px;
	word-wrap: break-word;
	word-break: break-all;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	margin-top: 5px;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 20px;
	letter-spacing: -0.5px;
	color: #333
}

html[data-user-agent*="Trident"] .card_good .card_good_title {
	display: block
}

.card_good .card_good_text {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	display: block;
	margin-top: 8px;
	color: #828282
}

.card_campaign {
	float: left;
	position: relative;
	width: 364px;
	height: 348px;
	margin-left: 24px;
	background-color: #000
}

.card_campaign:first-child {
	margin-left: 0
}

.card_campaign .card_campaign_img {
	opacity: 0.85
}

.card_campaign .card_campaign_content {
	position: absolute;
	right: 20px;
	bottom: 20px;
	left: 20px;
	z-index: 10;
	padding: 21px 20px 18px;
	background-color: #fff
}

.card_campaign .card_campaign_title {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	height: 50px;
	line-height: 25px;
	word-wrap: break-word;
	word-break: break-all;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 17px;
	letter-spacing: -0.5px;
	color: #333
}

html[data-user-agent*="Trident"] .card_campaign .card_campaign_title {
	display: block
}

.card_campaign .card_campaign_company {
	display: block;
	margin-top: 14px;
	font-size: 15px;
	line-height: 20px;
	color: #828282
}

.label_double_end {
	position: absolute;
	top: 0;
	right: 0;
	z-index: 10;
	width: 56px;
	height: 56px;
	padding-top: 7px;
	border: 1px solid rgba(0, 0, 0, 0.12);
	background-color: rgba(116, 116, 116, 0.9);
	font-family: NanumBarunGothic, Sans-serif;
	font-size: 14px;
	font-weight: normal;
	line-height: 20px;
	text-align: center;
	color: #fff
}

html[data-user-agent*="MSIE 8.0"] .label_double_end {
	border: 1px solid #666;
	background-color: #828282
}

.label_double_end ~ [class*='_content']:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 10;
	background-color: #000;
	opacity: .11;
	content: ''
}

html[data-user-agent*="MSIE 8.0"] .label_double_end ~ [class*='_content']:before
	{
	background-color: transparent
}

.label_double_success {
	position: absolute;
	top: 0;
	right: 0;
	z-index: 10;
	width: 56px;
	height: 56px;
	padding-top: 7px;
	border: 1px solid rgba(0, 0, 0, 0.12);
	background-color: rgba(116, 116, 116, 0.9);
	font-family: NanumBarunGothic, Sans-serif;
	font-size: 14px;
	font-weight: normal;
	line-height: 20px;
	text-align: center;
	color: #fff
}

html[data-user-agent*="MSIE 8.0"] .label_double_success {
	border: 1px solid #666;
	background-color: #828282
}

.label_double_success ~ [class*='_content']:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 10;
	background-color: #000;
	opacity: .11;
	content: ''
}

html[data-user-agent*="MSIE 8.0"] .label_double_success ~ [class*='_content']:before
	{
	background-color: transparent
}

.label_support_success, .label_success_epilogue {
	position: absolute;
	top: 0;
	right: 0;
	z-index: 10;
	width: 56px;
	height: 56px;
	padding-top: 7px;
	border: 1px solid rgba(0, 0, 0, 0.12);
	background-color: rgba(16, 200, 56, 0.9);
	font-family: NanumBarunGothic, Sans-serif;
	font-size: 14px;
	font-weight: normal;
	line-height: 20px;
	text-align: center;
	color: #fff
}

html[data-user-agent*="MSIE 8.0"] .label_support_success, html[data-user-agent*="MSIE 8.0"] .label_success_epilogue
	{
	border: 1px solid #0eb031;
	background-color: #28ce4c
}

.label_support_success ~ [class*='_content']:before,
	.label_success_epilogue ~ [class*='_content']:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 10;
	background-color: #000;
	opacity: .05;
	content: ''
}

html[data-user-agent*="MSIE 8.0"] .label_support_success ~ [class*='_content']:before,
	html[data-user-agent*="MSIE 8.0"] .label_success_epilogue ~ [class*='_content']:before
	{
	background-color: transparent
}

.label_funding_store {
	position: absolute;
	top: 0;
	right: 0;
	z-index: 10;
	width: 56px;
	height: 56px;
	padding-top: 7px;
	border: 1px solid rgba(0, 0, 0, 0.12);
	background-color: rgba(31, 158, 255, 0.9);
	font-family: NanumBarunGothic, Sans-serif;
	font-size: 14px;
	font-weight: normal;
	line-height: 20px;
	text-align: center;
	color: #fff
}

html[data-user-agent*="MSIE 8.0"] .label_funding_store {
	border: 1px solid #1b8be0;
	background-color: #35a8ff
}

.label_funding_store ~ [class*='_content']:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 10;
	background-color: #000;
	opacity: .05;
	content: ''
}

html[data-user-agent*="MSIE 8.0"] .label_funding_store ~ [class*='_content']:before
	{
	background-color: transparent
}

.label_funding_end {
	position: absolute;
	top: 0;
	right: 0;
	z-index: 10;
	width: 56px;
	height: 56px;
	padding-top: 7px;
	border: 1px solid rgba(0, 0, 0, 0.12);
	background-color: rgba(116, 116, 116, 0.9);
	font-family: NanumBarunGothic, Sans-serif;
	font-size: 14px;
	font-weight: normal;
	line-height: 20px;
	text-align: center;
	color: #fff
}

html[data-user-agent*="MSIE 8.0"] .label_funding_end {
	border: 1px solid #666;
	background-color: #828282
}

.label_funding_end ~ [class*='_content']:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 10;
	background-color: #000;
	opacity: .05;
	content: ''
}

html[data-user-agent*="MSIE 8.0"] .label_funding_end ~ [class*='_content']:before
	{
	background-color: transparent
}

.label_product_blue {
	position: absolute;
	top: 9px;
	right: 11px;
	z-index: 10;
	width: 52px;
	height: 52px;
	border: 1px solid rgba(0, 0, 0, 0.1);
	border-radius: 50%;
	background-color: rgba(31, 158, 255, 0.8);
	font-style: italic;
	font-weight: normal;
	line-height: 52px;
	text-align: center;
	color: #fff
}

html[data-user-agent*="MSIE 8.0"] .label_product_blue {
	border: 1px solid #1c8ee6;
	background-color: #4cb1ff
}

.label_product_pink {
	position: absolute;
	top: 9px;
	right: 11px;
	z-index: 10;
	width: 52px;
	height: 52px;
	border: 1px solid rgba(0, 0, 0, 0.1);
	border-radius: 50%;
	background-color: rgba(242, 84, 132, 0.8);
	font-style: italic;
	font-weight: normal;
	line-height: 52px;
	text-align: center;
	color: #fff
}

html[data-user-agent*="MSIE 8.0"] .label_product_pink {
	border: 1px solid #da4c77;
	background-color: #f5769d
}

.label_product_yellow {
	position: absolute;
	top: 9px;
	right: 11px;
	z-index: 10;
	width: 52px;
	height: 52px;
	border: 1px solid rgba(0, 0, 0, 0.1);
	border-radius: 50%;
	background-color: rgba(249, 175, 8, 0.8);
	font-style: italic;
	font-weight: normal;
	line-height: 52px;
	text-align: center;
	color: #fff
}

html[data-user-agent*="MSIE 8.0"] .label_product_yellow {
	border: 1px solid #e09e07;
	background-color: #fabf39
}

.label_product_gray {
	position: absolute;
	top: 9px;
	right: 11px;
	z-index: 10;
	width: 52px;
	height: 52px;
	border: 1px solid rgba(0, 0, 0, 0.1);
	border-radius: 50%;
	background-color: rgba(83, 83, 83, 0.8);
	font-style: italic;
	font-weight: normal;
	font-size: 12px;
	line-height: 14px;
	text-align: center;
	color: #fff;
	padding-top: 13px
}

html[data-user-agent*="MSIE 8.0"] .label_product_gray {
	border: 1px solid #4b4b4b;
	background-color: #757575
}

.card {
	float: left;
	position: relative;
	width: 267px;
	height: 381px;
	margin: 0 0 24px 24px;
	background-color: #fff;
	font-family: NanumSquareWebFont, Sans-serif
}

.card:after {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	border: 1px solid rgba(0, 0, 0, 0.11);
	content: ''
}

html[data-user-agent*="MSIE 8.0"] .card:after {
	border: 1px solid #e3e3e3
}

.card:hover:after, .card:focus:after {
	border-color: rgba(0, 0, 0, 0.35)
}

html[data-user-agent*="MSIE 8.0"] .card:hover:after, html[data-user-agent*="MSIE 8.0"] .card:focus:after
	{
	border: 1px solid #a6a6a6
}

.card .card_img {
	vertical-align: top
}

.card .card_content {
	padding: 21px 20px 0
}

.card .card_title {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	height: 50px;
	line-height: 25px;
	word-wrap: break-word;
	word-break: break-all;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	font-size: 17px;
	letter-spacing: -0.5px;
	color: #333
}

html[data-user-agent*="Trident"] .card .card_title {
	display: block
}

.card .card_organization {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	margin-top: 8px;
	font-family: NanumBarunGothic, Sans-serif;
	font-size: 15px;
	color: #828282
}

.card .card_bar {
	height: 5px;
	margin-top: 24px;
	background-color: #e8e8e8
}

.card .card_bar_collection {
	display: inline-block;
	height: 100%;
	background-color: #10c838;
	text-align: right;
	vertical-align: top
}

.card .card_bar_double {
	display: inline-block;
	width: 50%;
	height: 100%;
	background-color: #f69c00;
	vertical-align: top
}

.card .card_percent {
	display: inline-block;
	margin-top: 15px;
	font-size: 17px;
	letter-spacing: -0.2px;
	color: #00ab33
}

.card .card_money {
	float: right;
	margin-top: 15px;
	font-size: 17px;
	color: #333
}

.card .text {
	font-family: NanumBarunGothic, Sans-serif;
	font-size: 16px;
	font-weight: normal
}

.card_today {
	border: 1px solid rgba(0, 0, 0, 0.09);
	float: left;
	position: relative;
	width: 267px;
	height: 381px;
	margin: 0 0 24px 24px;
	display: table;
	background-color: #10c838;
	font-family: NanumSquareWebFont, Sans-serif;
	text-align: center;
	color: #fff
}

.card_today .card_today_inner {
	display: table-cell;
	vertical-align: middle
}

.card_today .label_today {
	display: block;
	width: 70px;
	margin: 0 auto;
	padding: 6px 0 5px;
	background-clip: padding-box;
	background-color: #0da82f;
	font-weight: bold;
	letter-spacing: 0.3px
}

.card_today .card_today_title {
	display: block;
	margin-top: 17px;
	font-size: 24px;
	line-height: 29px;
	letter-spacing: -1px;
	text-shadow: 0 1px 0 rgba(0, 0, 0, 0.25)
}

.card_today .card_today_text {
	display: inline-block;
	margin-top: 34px;
	padding: 0 5px;
	font-size: 20px;
	line-height: 30px;
	text-shadow: 0 1px 0 rgba(17, 74, 47, 0.26)
}

.card_today .card_today_text:before {
	display: block;
	width: 29px;
	height: 1px;
	margin: 0 auto 37px;
	background-color: #88e49c;
	content: ''
}

.card_today .card_today_text .point {
	font-weight: bold;
	color: #fff
}

.card_double {
	float: left;
	position: relative;
	width: 267px;
	height: 381px;
	margin: 0 0 24px 24px;
	display: table;
	border: 1px solid #e1980c;
	background-color: #f7a70d;
	font-family: NanumSquareWebFont, Sans-serif;
	text-align: center;
	color: #fff
}

.card_double .card_double_inner {
	display: table-cell;
	vertical-align: middle
}

.card_double .label_double {
	display: block;
	width: 70px;
	margin: 0 auto;
	padding: 6px 0 5px;
	background-color: #cf8c0b;
	letter-spacing: 0.3px
}

.card_double .card_double_title {
	display: block;
	margin-top: 17px;
	font-size: 24px;
	line-height: 29px;
	letter-spacing: -1px;
	text-shadow: 0 1px 0 rgba(150, 99, 16, 0.26)
}

.card_double .card_double_text {
	display: inline-block;
	margin-top: 34px;
	font-size: 20px;
	line-height: 30px;
	text-shadow: 0 1px 0 rgba(150, 99, 16, 0.26)
}

.card_double .card_double_text:before {
	display: block;
	width: 29px;
	height: 1px;
	margin: 0 auto 38px;
	background-color: #f7d187;
	content: ''
}

.card_small {
	float: left;
	position: relative;
	width: 240px;
	height: 343px;
	margin-right: 24px;
	background-color: #fff
}

.card_small:before {
	border: 1px solid rgba(0, 0, 0, 0.11);
	position: absolute;
	top: 0;
	right: 0;
	left: 0;
	height: 180px;
	content: ''
}

html[data-user-agent*="MSIE 8.0"] .card_small:before {
	border: 1px solid #e3e3e3
}

.card_small:hover:after, .card_small:focus:after {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	border: 1px solid rgba(0, 0, 0, 0.35);
	content: ''
}

html[data-user-agent*="MSIE 8.0"] .card_small:hover:after, html[data-user-agent*="MSIE 8.0"] .card_small:focus:after
	{
	border: 1px solid #a6a6a6
}

.card_small .card_img {
	vertical-align: top
}

.card_small .card_content {
	padding: 19px 18px 0
}

.card_small .card_title {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	height: 46px;
	line-height: 23px;
	word-wrap: break-word;
	word-break: break-all;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	font-size: 16px;
	font-weight: normal
}

html[data-user-agent*="Trident"] .card_small .card_title {
	display: block
}

.card_small .card_organization {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	margin-top: 8px;
	letter-spacing: -0.5px;
	color: #828282
}

.card_small .card_bar {
	height: 4px;
	margin-top: 19px;
	background-color: #e8e8e8
}

.card_small .card_bar_collection {
	display: inline-block;
	height: 100%;
	background-color: #00c73c;
	text-align: right;
	vertical-align: top
}

.card_small .card_bar_double {
	display: inline-block;
	width: 50%;
	height: 100%;
	background-color: #f69c00;
	vertical-align: top
}

.card_small .card_percent {
	display: inline-block;
	margin-top: 13px;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 16px;
	color: #00ab33
}

.card_small .card_money {
	float: right;
	margin-top: 13px;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 16px
}

.card_small .text {
	font-weight: normal
}

.card_epilogue, .card_epilogue_point {
	float: left;
	position: relative;
	width: 364px;
	height: 522px;
	margin: 0 0 24px 24px;
	text-align: center
}

.card_epilogue .label_epilogue, .card_epilogue_point .label_epilogue {
	display: inline-block;
	margin: 29px auto 0;
	padding: 1px 10px 0;
	border: 1px solid #1dbf49;
	background-color: #fff;
	font-size: 15px;
	line-height: 27px;
	color: #00ab33
}

.card_epilogue .card_epilogue_title, .card_epilogue_point .card_epilogue_title
	{
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	height: 60px;
	line-height: 30px;
	word-wrap: break-word;
	word-break: keep-all;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	margin: 19px 21px 0;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 20px;
	letter-spacing: -0.5px
}

html[data-user-agent*="Trident"] .card_epilogue .card_epilogue_title,
	html[data-user-agent*="Trident"] .card_epilogue_point .card_epilogue_title
	{
	display: block
}

.card_epilogue .card_img_wrap, .card_epilogue_point .card_img_wrap {
	display: inline-block;
	position: relative;
	margin-top: 25px
}

.card_epilogue .card_img_wrap:after, .card_epilogue_point .card_img_wrap:after
	{
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	border: 1px solid rgba(0, 0, 0, 0.1);
	content: ''
}

.card_epilogue .card_epilogue_img, .card_epilogue_point .card_epilogue_img
	{
	vertical-align: top
}

.card_epilogue .card_epilogue_text, .card_epilogue_point .card_epilogue_text
	{
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	height: 69px;
	line-height: 23px;
	word-wrap: break-word;
	word-break: keep-all;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	margin: 19px 21px 0;
	font-size: 15px;
	text-align: left;
	color: #828282
}

html[data-user-agent*="Trident"] .card_epilogue .card_epilogue_text,
	html[data-user-agent*="Trident"] .card_epilogue_point .card_epilogue_text
	{
	display: block
}

.card_epilogue {
	border: 1px solid #e6e6e6
}

.card_epilogue:hover, .card_epilogue:focus {
	border-color: #a6a6a6
}

.card_epilogue_point {
	border: 1px solid #38d467;
	background-color: #e7faed
}

.card_epilogue_point:hover, .card_epilogue_point:focus {
	border-color: #14a03a
}

.card_special {
	float: left;
	position: relative;
	width: 267px;
	height: 381px;
	margin: 0 0 24px 24px
}

.card_support {
	float: left;
	position: relative;
	width: 267px;
	height: 363px;
	margin: 0 0 24px 24px;
	display: block;
	padding: 52px 19px 20px;
	border: 1px solid #2aa3ff;
	background-color: #1f9eff;
	color: #fff
}

.card_support .card_support_title {
	display: block;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 23px;
	line-height: 32px;
	letter-spacing: -0.5px;
	text-align: center
}

.card_support .card_support_list {
	margin-top: 44px
}

.card_support .card_support_item {
	margin-top: 6px;
	padding: 9px 0 9px 25px;
	border: 1px solid #62bbff;
	font-size: 15px;
	letter-spacing: -0.5px
}

.icon_bean {
	display: inline-block;
	margin-right: 10px;
	vertical-align: middle;
	background-position: -570px -480px;
	width: 34px;
	height: 26px
}

.icon_delivery {
	display: inline-block;
	margin-right: 10px;
	vertical-align: middle;
	background-position: -348px -515px;
	width: 34px;
	height: 26px
}

.icon_commission {
	display: inline-block;
	margin-right: 10px;
	vertical-align: middle;
	background-position: -390px -515px;
	width: 34px;
	height: 26px
}

.card_fund {
	float: left;
	position: relative;
	width: 267px;
	height: 363px;
	margin: 0 0 24px 24px
}

.card_fund:after {
	border: 1px solid rgba(0, 0, 0, 0.1);
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	content: ''
}

html[data-user-agent*="MSIE 8.0"] .card_fund:after {
	border: 1px solid #e6e6e6
}

.card_fund:hover:after, .card_fund:focus:after {
	border-color: rgba(0, 0, 0, 0.35)
}

html[data-user-agent*="MSIE 8.0"] .card_fund:hover:after, html[data-user-agent*="MSIE 8.0"] .card_fund:focus:after
	{
	border: 1px solid #a6a6a6
}

.card_fund .card_fund_img {
	vertical-align: top
}

.card_fund .card_fund_content {
	padding: 21px 88px 12px 20px
}

.card_fund .card_fund_title {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	height: 50px;
	line-height: 25px;
	word-wrap: break-word;
	word-break: keep-all;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 17px;
	letter-spacing: -0.5px;
	color: #333
}

html[data-user-agent*="Trident"] .card_fund .card_fund_title {
	display: block
}

.card_fund .card_fund_organization {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	margin-top: 8px;
	font-size: 15px;
	letter-spacing: -0.5px;
	color: #828282
}

.card_fund .card_fund_percent {
	position: absolute;
	right: 16px;
	bottom: 88px;
	width: 55px;
	height: 55px;
	border: 1px solid #1f9eff;
	border-radius: 50%;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 17px;
	line-height: 55px;
	letter-spacing: -0.6px;
	text-align: center;
	color: #1f9eff
}

.card_fund .card_fund_percent .percent {
	font-size: 15px
}

.card_fund .card_fund_percent.is_exceed {
	font-size: 16px;
	letter-spacing: -1px
}

.card_fund .card_fund_day {
	position: absolute;
	bottom: 0;
	left: 18px;
	line-height: 40px;
	letter-spacing: -0.5px;
	color: #828282
}

.card_fund .card_fund_money {
	position: absolute;
	right: 0;
	bottom: 0;
	left: 0;
	height: 41px;
	padding-right: 18px;
	border-top: 1px solid #f2f2f2;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 16px;
	line-height: 39px;
	letter-spacing: -0.2px;
	text-align: right;
	color: #333
}

.card_fund .card_fund_money .text {
	font-family: NanumBarunGothic, Sans-serif;
	font-weight: normal
}

.card_fund_epilogue {
	float: left;
	position: relative;
	width: 364px;
	height: 445px;
	margin: 0 0 24px 24px;
	padding: 0 22px 22px;
	background-color: #fff;
	text-align: center
}

.card_fund_epilogue:after {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	border: 1px solid rgba(0, 0, 0, 0.1);
	content: ''
}

html[data-user-agent*="MSIE 8.0"] .card_fund_epilogue:after {
	border: 1px solid #e6e6e6
}

.card_fund_epilogue:hover:after, .card_fund_epilogue:focus:after {
	border-color: rgba(0, 0, 0, 0.35)
}

html[data-user-agent*="MSIE 8.0"] .card_fund_epilogue:hover:after, html[data-user-agent*="MSIE 8.0"] .card_fund_epilogue:focus:after
	{
	border: 1px solid #a6a6a6
}

.card_fund_epilogue .card_img_wrap {
	position: relative;
	margin-top: 19px
}

.card_fund_epilogue .card_img_wrap:after {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	border: 1px solid rgba(0, 0, 0, 0.1);
	content: ''
}

html[data-user-agent*="MSIE 8.0"] .card_fund_epilogue .card_img_wrap:after
	{
	border: 1px solid #e6e6e6
}

.card_fund_epilogue_organization {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	display: inline-block;
	max-width: 100%;
	margin-top: 30px;
	padding: 5px 9px 4px;
	border: 1px solid #1f9eff;
	font-size: 15px;
	vertical-align: top;
	color: #1f9eff
}

.card_fund_epilogue_title {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	height: 60px;
	line-height: 30px;
	word-wrap: break-word;
	word-break: keep-all;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	margin-top: 16px;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 20px;
	font-weight: bold;
	letter-spacing: -0.5px
}

html[data-user-agent*="Trident"] .card_fund_epilogue_title {
	display: block
}

.card_fund_epilogue_text {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	margin-top: 9px;
	font-size: 15px;
	letter-spacing: -0.5px;
	color: #828282
}

.card_fund_epilogue_img {
	vertical-align: top
}

.card_product {
	float: left;
	position: relative;
	width: 267px;
	height: 345px;
	margin: 0 0 24px 24px
}

.card_product_content {
	display: block;
	position: relative;
	height: 290px
}

.card_product_content:after {
	border: 1px solid rgba(0, 0, 0, 0.1);
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	border-bottom: 0;
	content: ''
}

html[data-user-agent*="MSIE 8.0"] .card_product_content:after {
	border: 1px solid #e6e6e6;
	border-bottom: 0
}

.card_product_img {
	vertical-align: top
}

.card_product_title {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	display: block;
	margin: 21px 21px 0;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 17px;
	line-height: 25px;
	letter-spacing: -0.5px;
	color: #333
}

.card_product_price {
	margin: 4px 21px 0;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 16px;
	letter-spacing: -0.2px;
	color: #1f9eff
}

.card_product_price .text {
	font-family: NanumBarunGothic, Sans-serif;
	font-size: 15px
}

.card_product_agent {
	display: block;
	position: relative;
	height: 55px;
	padding: 0 50px 0 21px;
	background-color: #fafafb
}

.card_product_agent:before {
	background-position: -550px -469px;
	width: 7px;
	height: 13px;
	position: absolute;
	top: 50%;
	right: 21px;
	margin-top: -6px;
	content: ''
}

.card_product_agent:after {
	border: 1px solid rgba(0, 0, 0, 0.1);
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	border-top-color: rgba(0, 0, 0, 0.05);
	content: ''
}

html[data-user-agent*="MSIE 8.0"] .card_product_agent:after {
	border: 1px solid #e6e6e6;
	border-top-color: #f2f2f2
}

.card_product_brand {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	padding-top: 9px;
	letter-spacing: -0.5px;
	color: #333
}

.card_product_tag {
	font-size: 13px;
	letter-spacing: -0.5px;
	color: #a2a2a2
}

.card_product_tag .tag {
	margin-right: 5px
}

.card_product_tag .tag:before {
	content: '#'
}

.card_store {
	float: left;
	position: relative;
	width: 364px;
	height: 483px;
	margin: 0 0 24px 24px;
	padding: 20px 20px 0;
	border: 1px solid #e6e6e6
}

.card_store_img {
	background-repeat: no-repeat;
	background-position: 50% 50%;
	background-size: cover;
	height: 240px
}

.card_store_title {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	display: block;
	margin-top: 21px;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 20px;
	line-height: 25px;
	letter-spacing: -0.6px;
	color: #333
}

.card_store_text {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	height: 50px;
	line-height: 25px;
	word-wrap: break-word;
	word-break: keep-all;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	margin-top: 10px;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 17px;
	letter-spacing: -0.5px;
	color: #828282
}

html[data-user-agent*="Trident"] .card_store_text {
	display: block
}

.card_store_inner {
	margin: 24px -20px 0;
	padding: 16px 20px 17px;
	border-top: 1px solid #f2f2f2
}

.card_store_inner:after {
	display: table;
	table-layout: fixed;
	clear: both;
	content: ''
}

.card_store_simg {
	float: left;
	margin-right: 15px
}

.card_store_brand {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	margin-top: 8px;
	font-size: 15px;
	letter-spacing: -0.5px;
	color: #828282
}

.card_store_price {
	overflow: hidden;
	margin-top: 4px;
	font-size: 16px;
	color: #333
}

.category_theme_area {
	background-color: #10c838
}

.category_theme_inner {
	width: 1140px;
	margin: 0 auto;
	padding: 48px 20px 42px;
	font-size: 0
}

.category_theme_item {
	display: inline-block;
	width: 100px;
	text-align: center
}

.category_theme_label {
	display: inline-block;
	position: relative;
	padding-top: 73px;
	font-size: 16px;
	color: #cef9cf
}

.category_theme_label:before {
	position: absolute;
	left: 50%;
	width: 62px;
	margin-left: -31px;
	top: 0;
	height: 62px;
	border: 1px solid #0dab30;
	border-radius: 50%;
	background-color: #0eb432;
	content: ''
}

.category_theme_radio:checked+.category_theme_label {
	font-weight: bold;
	color: #fff
}

.category_theme_radio:checked+.category_theme_label:before {
	border: 0;
	background-color: #fff
}

.category_theme_radio.is_checked+.category_theme_label {
	font-weight: bold;
	color: #fff
}

.category_theme_radio.is_checked+.category_theme_label:before {
	border: 0;
	background-color: #fff
}

[class*='theme_icon'] {
	position: absolute;
	top: 0;
	left: 50%;
	margin-left: -31px
}

.theme_icon0 {
	background-position: -144px -376px;
	width: 62px;
	height: 62px
}

.theme_icon3 {
	background-position: -376px -306px;
	width: 62px;
	height: 62px
}

.theme_icon4 {
	background-position: -376px -235px;
	width: 62px;
	height: 63px
}

.theme_icon5 {
	background-position: -4px -376px;
	width: 62px;
	height: 63px
}

.theme_icon6 {
	background-position: -500px -4px;
	width: 62px;
	height: 62px
}

.theme_icon7 {
	background-position: -214px -376px;
	width: 62px;
	height: 62px
}

.theme_icon8 {
	background-position: -284px -376px;
	width: 62px;
	height: 62px
}

.theme_icon9 {
	background-position: -354px -376px;
	width: 62px;
	height: 62px
}

.theme_icon10 {
	background-position: -74px -376px;
	width: 62px;
	height: 63px
}

.theme_icon11 {
	background-position: -376px -164px;
	width: 62px;
	height: 63px
}

.theme_icon12 {
	background-position: -424px -376px;
	width: 62px;
	height: 62px
}

.category_support_wrap {
	background-color: #0fba34
}

.category_support_inner {
	width: 1140px;
	margin: 0 auto;
	padding: 12px 0 11px;
	font-size: 0;
	text-align: center
}

.category_support_link {
	display: inline-block;
	position: relative;
	padding: 6px 23px 6px 12px;
	background-color: #0d9e2c;
	font-size: 15px;
	text-align: center;
	vertical-align: top;
	color: #fff
}

.category_support_link:before {
	background-position: -208px -560px;
	width: 7px;
	height: 11px;
	position: absolute;
	top: 50%;
	right: 10px;
	margin-top: -6px;
	content: ''
}

.category_support_area {
	display: inline-block;
	overflow: hidden;
	position: relative;
	max-width: 967px;
	margin-left: 35px;
	vertical-align: top
}

.category_support_list {
	overflow: hidden;
	height: 31px
}

.category_support_list.is_overflow {
	padding: 0 34px 0 23px;
	text-align: left
}

.category_support_item {
	display: inline-block
}

.category_support_label {
	display: inline-block;
	position: relative;
	padding: 6px 16px 5px;
	font-size: 15px;
	color: #cef9cf
}

.category_support_radio:checked+.category_support_label {
	font-weight: bold;
	color: #fff
}

.category_support_radio:checked+.category_support_label:before {
	position: absolute;
	right: 16px;
	bottom: 1px;
	left: 16px;
	height: 2px;
	background-color: #fff;
	content: ''
}

.category_support_radio.is_checked+.category_support_label {
	font-weight: bold;
	color: #fff
}

.category_support_radio.is_checked+.category_support_label:before {
	position: absolute;
	right: 16px;
	bottom: 1px;
	left: 16px;
	height: 2px;
	background-color: #fff;
	content: ''
}

.category_support_previous {
	position: absolute;
	top: 0;
	left: 0;
	width: 34px;
	height: 31px;
	padding-right: 11px;
	background-clip: content-box;
	background-color: #0fba34
}

.category_support_previous:before {
	background-position: -544px -414px;
	width: 14px;
	height: 25px;
	position: absolute;
	top: 2px;
	left: 2px;
	content: ''
}

.category_support_previous:after {
	background: -webkit-gradient(linear, left top, right top, from(#0fba34),
		to(rgba(15, 186, 52, 0)));
	background: linear-gradient(to right, #0fba34 0%, rgba(15, 186, 52, 0)
		100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#0fba34',
		endColorstr='rgba(15,186,52,0)', GradientType=1);
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	width: 12px;
	content: ''
}

.category_support_previous:hover:before, .category_support_previous:focus:before
	{
	background-position: -522px -414px
}

.category_support_next {
	position: absolute;
	top: 0;
	right: -1px;
	width: 34px;
	height: 31px;
	padding-left: 12px;
	background-clip: content-box;
	background-color: #0fba34
}

.category_support_next:before {
	background-position: -500px -414px;
	width: 14px;
	height: 25px;
	position: absolute;
	top: 2px;
	right: 2px;
	content: ''
}

.category_support_next:after {
	background: -webkit-gradient(linear, left top, right top, from(rgba(15, 186, 52, 0)),
		to(#0fba34));
	background: linear-gradient(to right, rgba(15, 186, 52, 0) 0%, #0fba34
		100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='rgba(15,186,52,0)',
		endColorstr='#0fba34', GradientType=1);
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	width: 12px;
	content: ''
}

.category_support_next:hover:before, .category_support_next:focus:before
	{
	background-position: -612px -480px
}

.sorting_wrap {
	text-align: right
}

.content_title {
	float: left;
	padding-top: 7px;
	font-size: 19px;
	font-weight: normal;
	line-height: 22px;
	letter-spacing: -0.5px;
	color: #333
}

.content_title .point {
	font-family: NanumSquareWebFont, Sans-serif;
	font-weight: bold;
	letter-spacing: 0;
	color: #00ab33
}

.sorting_area, .sorting_area_stretch {
	display: inline-block;
	position: relative;
	vertical-align: top
}

.sorting_area .sorting_button, .sorting_area_stretch .sorting_button {
	position: relative;
	padding: 2PX 39px 0 13px;
	border: 1px solid #e3e3e3;
	line-height: 32px;
	text-align: left;
	white-space: nowrap;
	color: #333
}

.sorting_area .sorting_button:after, .sorting_area_stretch .sorting_button:after
	{
	background-position: -510px -515px;
	width: 12px;
	height: 7px;
	position: absolute;
	top: 50%;
	right: 11px;
	margin-top: -2px;
	content: ''
}

.sorting_area .sorting_button[aria-expanded='true'],
	.sorting_area_stretch .sorting_button[aria-expanded='true'] {
	border-color: #202020
}

.sorting_area .sorting_button[aria-expanded='true']:after,
	.sorting_area_stretch .sorting_button[aria-expanded='true']:after {
	background-position: -530px -515px
}

.sorting_area .sorting_list, .sorting_area_stretch .sorting_list {
	position: absolute;
	top: 35px;
	right: 0;
	left: 0;
	z-index: 20;
	padding: 12px 0;
	border: 1px solid #202020;
	background-color: #fff;
	text-align: left;
	color: #333
}

.sorting_area .sorting_item, .sorting_area_stretch .sorting_item {
	display: inline-block;
	position: relative;
	margin-right: 4px;
	padding: 9px 14px;
	outline: none;
	line-height: 17px;
	cursor: pointer
}

.sorting_area .sorting_item:hover:before, .sorting_area .sorting_item:focus:before,
	.sorting_area_stretch .sorting_item:hover:before, .sorting_area_stretch .sorting_item:focus:before
	{
	position: absolute;
	right: 15px;
	bottom: 8px;
	left: 15px;
	height: 1px;
	background-color: #909090;
	content: ''
}

.sorting_area .sorting_button {
	width: 140px
}

.sorting_area_stretch .sorting_button {
	width: 99px
}

.checkbox_area {
	display: inline-block;
	margin-right: 13px;
	vertical-align: top;
	color: #333
}

.checkbox_area .checkbox_label {
	display: inline-block;
	margin-top: 8px;
	line-height: 22px
}

.checkbox_area .checkbox_label:before {
	display: inline-block;
	width: 22px;
	height: 22px;
	margin-right: 7px;
	border: 1px solid #e3e3e3;
	vertical-align: top;
	content: ''
}

.checkbox_area .checkbox_input:checked+.checkbox_label {
	position: relative
}

.checkbox_area .checkbox_input:checked+.checkbox_label:before {
	border: 0;
	background-color: #1dbf49
}

.checkbox_area .checkbox_input:checked+.checkbox_label:after {
	background-image:
		url(https://ssl.pstatic.net/happyimg2/img/pc/sp_hb_svg_ce6872ab.png);
	background-image: -webkit-gradient(linear, left top, left bottom, from(transparent),
		to(transparent)),
		url(https://ssl.pstatic.net/happyimg2/img/pc/sp_hb_svg_b46450d1.svg);
	background-image: linear-gradient(transparent, transparent),
		url(https://ssl.pstatic.net/happyimg2/img/pc/sp_hb_svg_b46450d1.svg);
	background-size: 634px 621px;
	background-position: -486px -515px;
	width: 16px;
	height: 11px;
	position: absolute;
	top: 50%;
	left: 3px;
	margin-top: -5px;
	content: ''
}

.checkbox_area .checkbox_input.is_checked+.checkbox_label {
	position: relative
}

.checkbox_area .checkbox_input.is_checked+.checkbox_label:before {
	border: 0;
	background-color: #1dbf49
}

.checkbox_area .checkbox_input.is_checked+.checkbox_label:after {
	background-position: -486px -515px;
	width: 16px;
	height: 11px;
	position: absolute;
	top: 50%;
	left: 3px;
	margin-top: -5px;
	content: ''
}

.sorting_area2 {
	float: left;
	position: relative;
	margin-top: 10px
}

.sorting_area2 .sorting_button {
	position: relative;
	min-width: 97px;
	padding-right: 20px;
	font-size: 19px;
	letter-spacing: -0.5px;
	text-align: left;
	white-space: nowrap;
	color: #333
}

.sorting_area2 .sorting_button:after {
	background-position: -510px -515px;
	width: 12px;
	height: 7px;
	position: absolute;
	top: 50%;
	right: 0;
	margin-top: -4px;
	content: ''
}

.sorting_area2 .sorting_button[aria-expanded='true'] {
	border-color: #202020
}

.sorting_area2 .sorting_button[aria-expanded='true']:after {
	background-position: -530px -515px
}

.sorting_area2 .point {
	margin-left: 9px;
	font-family: NanumSquareWebFont, Sans-serif;
	font-weight: bold;
	letter-spacing: 0;
	color: #00ab33
}

.sorting_area2 .sorting_list {
	position: absolute;
	top: 25px;
	right: -8px;
	left: 0;
	z-index: 20;
	padding: 10px 0;
	border: 1px solid #202020;
	background-color: #fff;
	text-align: left;
	color: #333
}

.sorting_area2 .sorting_item {
	padding: 8px 15px;
	outline: none;
	line-height: 16px;
	cursor: pointer
}

.sorting_area2 .sorting_item:hover, .sorting_area2 .sorting_item:focus {
	color: #00ab33
}

.double_top_wrap {
	display: table;
	width: 100%;
	min-height: 288px;
	background: #10c838
		url("https://ssl.pstatic.net/happyimg2/img/pc/double_illust.png")
		no-repeat 50% 100%
}

.double_top_wrap.is_on .double_sorting_year {
	margin-right: 0
}

.double_top_wrap.is_on .double_top_text1 {
	display: block;
	margin-top: 18px
}

.double_top_wrap.is_on .double_top_text2, .double_top_wrap.is_on .link_rectangle
	{
	display: none
}

.double_top_inner {
	display: table-cell;
	font-family: NanumSquareWebFont, Sans-serif;
	text-align: center;
	vertical-align: middle;
	color: #fff
}

.double_sorting_year {
	display: inline-block;
	position: relative;
	z-index: 20;
	margin-right: 13px;
	vertical-align: bottom
}

.double_sorting_year .sorting_button {
	position: relative;
	width: 100%;
	height: 44px;
	padding: 0 15px;
	border: 1px solid #fff;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 24px;
	font-weight: bold;
	line-height: 29px;
	letter-spacing: -0.4px;
	color: inherit
}

.double_sorting_year .sorting_button:after {
	background-position: -522px -492px;
	width: 16px;
	height: 10px;
	display: inline-block;
	position: relative;
	top: -1px;
	margin-left: 17px;
	vertical-align: middle;
	content: ''
}

.double_sorting_year .sorting_button[aria-expanded='true']:after {
	background-position: -546px -492px
}

.double_sorting_year .sorting_list {
	overflow-y: auto;
	position: absolute;
	top: 42px;
	right: 0;
	left: 0;
	z-index: 10;
	max-height: 340px;
	padding: 14px 0;
	border: 1px solid #202020;
	background-color: #fff;
	text-align: left
}

.double_sorting_year .sorting_item {
	display: block;
	position: relative;
	padding: 7px 15px;
	outline: none;
	font-family: NanumBarunGothic, Sans-serif;
	font-size: 15px;
	line-height: 17px;
	color: #202020;
	cursor: pointer
}

.double_sorting_year .sorting_item:hover:before, .double_sorting_year .sorting_item:focus:before
	{
	position: absolute;
	bottom: 6px;
	left: 15px;
	width: 84px;
	height: 1px;
	background-color: #909090;
	content: ''
}

.double_top_text1 {
	display: inline-block;
	font-size: 32px;
	line-height: 44px;
	letter-spacing: -0.5px;
	vertical-align: middle
}

.double_top_text1 .point {
	font-weight: bold
}

.double_top_text1 .point:before {
	content: '\2018'
}

.double_top_text1 .point:after {
	content: '\2019'
}

.double_top_text2 {
	margin-top: 15px;
	font-size: 23px;
	line-height: 29px;
	letter-spacing: -0.3px;
	text-shadow: 0 1px 0 rgba(0, 0, 0, 0.14);
	color: #fff
}

.link_rectangle {
	display: inline-block;
	margin-top: 18px;
	padding: 10px 12px 8px;
	background-color: #0da82f;
	font-family: NanumBarunGothic, Sans-serif;
	font-size: 16px
}

.special_top_wrap {
	text-align: center
}

.special_top_img {
	vertical-align: top
}

.double_chart_wrap {
	margin-top: 48px
}

.double_chart_area {
	position: relative;
	margin-top: 14px;
	padding-bottom: 23px;
	border: 1px solid #e6e6e6;
	text-align: center
}

.double_chart_list {
	overflow: hidden;
	height: 206px;
	margin: 41px 95px 0
}

.double_chart_inner {
	overflow: hidden;
	width: 2080px
}

.double_chart_text {
	margin-top: 48px;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 27px;
	line-height: 42px;
	letter-spacing: -1px;
	color: #151515
}

.double_chart_text .point {
	color: #00ab33
}

.double_chart_text .numscroller {
	font-weight: bold
}

.double_chart_item {
	float: left;
	position: relative;
	width: 190px;
	padding-top: 134px;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 17px;
	font-weight: bold
}

.double_chart_item:before {
	position: absolute;
	top: 0;
	left: 50%;
	width: 116px;
	height: 116px;
	margin-left: -58px;
	border-radius: 50%;
	background-color: #f6f6f6;
	content: ''
}

[class*='theme_icon_big'] {
	position: absolute;
	top: 0;
	left: 50%;
	margin-left: -58px
}

.theme_icon_big3 {
	background-position: -4px -4px;
	width: 116px;
	height: 116px
}

.theme_icon_big4 {
	background-position: -376px -4px;
	width: 116px;
	height: 116px
}

.theme_icon_big5 {
	background-position: -252px -252px;
	width: 116px;
	height: 116px
}

.theme_icon_big6 {
	background-position: -128px -252px;
	width: 116px;
	height: 116px
}

.theme_icon_big7 {
	background-position: -4px -252px;
	width: 116px;
	height: 116px
}

.theme_icon_big8 {
	background-position: -252px -128px;
	width: 116px;
	height: 116px
}

.theme_icon_big9 {
	background-position: -252px -4px;
	width: 116px;
	height: 116px
}

.theme_icon_big10 {
	background-position: -128px -128px;
	width: 116px;
	height: 116px
}

.theme_icon_big11 {
	background-position: -4px -128px;
	width: 116px;
	height: 116px
}

.theme_icon_big12 {
	background-position: -128px -4px;
	width: 116px;
	height: 116px
}

.double_chart_number {
	display: block;
	margin-top: 13px;
	font-family: NanumSquareWebFont, Sans-serif;
	font-size: 16px;
	color: #828282
}

.double_chart_previous, .double_chart_next {
	position: absolute;
	top: 50%;
	width: 39px;
	height: 60px;
	margin-top: -24px;
	background-color: #f6f6f6
}

.double_chart_previous:before, .double_chart_next:before {
	display: inline-block;
	vertical-align: middle;
	content: ''
}

.double_chart_previous[disabled], .double_chart_next[disabled] {
	cursor: default
}

.double_chart_previous {
	left: 0
}

.double_chart_previous:before {
	background-position: -522px -447px;
	width: 20px;
	height: 37px;
	margin-right: 5px
}

.double_chart_previous[disabled]:before {
	background-position: -236px -515px
}

.double_chart_previous:not ([disabled] ):hover:before,
	.double_chart_previous:not ([disabled] ):focus:before {
	background-position: -264px -515px
}

.double_chart_next {
	right: 0
}

.double_chart_next:before {
	background-position: -320px -515px;
	width: 20px;
	height: 37px;
	margin-left: 5px
}

.double_chart_next[disabled]:before {
	background-position: -292px -515px
}

.double_chart_next:not ([disabled] ):hover:before, .double_chart_next:not
	([disabled] ):focus:before {
	background-position: -208px -515px
}

.recommend_area {
	margin-top: 48px;
	border: 1px solid #e6e6e6;
	background-color: #f6f6f6
}

.recommend_area:after {
	display: table;
	table-layout: fixed;
	clear: both;
	content: ''
}

.label_recommend {
	display: block;
	width: 49px;
	margin: 33px auto 0;
	padding-top: 1px;
	background-color: #f69c00;
	line-height: 24px;
	text-align: center;
	color: #fff
}

.recommend_title {
	margin-top: 15px;
	font-size: 20px;
	font-weight: normal;
	line-height: 26px;
	text-align: center
}

.recommend_card_wrap {
	overflow: hidden;
	margin: 25px 0 48px 54px
}

.api_ly {
	overflow: hidden;
	position: fixed;
	top: 15px;
	right: 15px;
	z-index: 100;
	width: 270px;
	padding: 20px 20px 20px 66px;
	font-family: '\B3CB\C6C0', Dotum, '\B9D1\C740\ACE0\B515',
		'malgun gothic', 'Apple SD Gothic Neo', Helvetica, sans-serif;
	-webkit-box-sizing: content-box;
	box-sizing: content-box
}

.api_ly * {
	-webkit-box-sizing: content-box;
	box-sizing: content-box
}

.api_ly .api_thum {
	background-position: 0px -67px;
	width: 26px;
	height: 28px;
	position: absolute;
	top: 50%;
	left: 20px;
	margin-top: -14px
}

.api_ly_bg {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: -1;
	background-color: #30323b;
	opacity: 0.98;
	filter: alpha(opacity = 98)
}

.api_ly p {
	font-size: 15px;
	font-weight: bold;
	line-height: 19px;
	letter-spacing: -0.05em;
	text-align: left;
	color: #fff
}

.api_ly p em {
	color: #89b51b
}

.api_ly p em em {
	font-family: arial, Helvetica, sans-serif;
	font-size: 16px;
	line-height: normal;
	vertical-align: -1px
}

.api_ly p .txt_green {
	color: #89b524
}

.api_ly p small {
	margin-left: 3px;
	font-size: 12px;
	color: #939393
}

.api_ly .my_money {
	display: inline-block;
	width: 155px;
	margin-top: 10px;
	font-size: 12px;
	letter-spacing: -0.05em;
	color: #aaa
}

.api_ly .my_money a {
	font-family: arial, Helvetica, sans-serif;
	font-size: 13px;
	line-height: normal;
	letter-spacing: 0;
	text-decoration: underline;
	vertical-align: -1px;
	color: #89b51b
}

.api_ly .ly_clse {
	background-position: -54px -67px;
	width: 12px;
	height: 12px;
	position: absolute;
	top: 12px;
	right: 12px;
	text-indent: -9999px
}

.api_ly .btn_give {
	display: inline-block;
	margin-top: 10px;
	font-size: 13px;
	line-height: 18px;
	letter-spacing: -0.05em;
	text-decoration: underline;
	color: #6fa10f
}

.api_ly .btn_give span {
	background-position: -85px -67px;
	width: 3px;
	height: 5px;
	display: inline-block;
	margin: 0 0 0 1px;
	vertical-align: 1px
}

.funding_banner_wrap {
	overflow: hidden;
	position: relative;
	height: 364px
}

.funding_banner_inner {
	height: 100%
}

.funding_banner_list:after {
	display: table;
	table-layout: fixed;
	clear: both;
	content: ''
}

.funding_banner_item {
	overflow: hidden;
	float: left;
	position: relative;
	height: 364px
}

.funding_banner_content {
	position: absolute;
	top: 0;
	left: 50%;
	margin-left: -960px;
	background-color: #000
}

.funding_banner_img {
	vertical-align: top
}

.funding_banner_navigator {
	position: absolute;
	right: 0;
	bottom: 16px;
	left: 0;
	font-size: 0;
	line-height: 8px;
	text-align: center
}

.funding_banner_navigator .swiper-pagination-bullet {
	display: inline-block;
	width: 8px;
	height: 8px;
	margin: 0 3px;
	border-radius: 4px;
	background-color: rgba(255, 255, 255, 0.6);
	vertical-align: top
}

html[data-user-agent*="MSIE 8.0"] .funding_banner_navigator .swiper-pagination-bullet
	{
	background-color: #fff
}

.funding_banner_navigator .swiper-pagination-bullet.swiper-pagination-bullet-active
	{
	background-color: #00ed6d
}

.store_banner_wrap {
	overflow: hidden;
	position: relative;
	height: 364px
}

.store_banner_inner {
	height: 100%
}

.store_banner_list:after {
	display: table;
	table-layout: fixed;
	clear: both;
	content: ''
}

.store_banner_item {
	float: left;
	width: 1140px;
	height: 364px;
	padding: 0 1px;
	-webkit-box-sizing: content-box;
	box-sizing: content-box
}

.store_banner_item.is_active .store_banner_img {
	opacity: 1;
	filter: Alpha(opacity = 100)
}

@media all and (max-width: 1141px) {
	.store_banner_item {
		padding: 0
	}
}

.store_banner_content {
	display: inline-block;
	background-color: #000
}

.store_banner_img {
	opacity: 0.8;
	vertical-align: top;
	filter: Alpha(opacity = 80)
}

.store_banner_navigator {
	position: absolute;
	right: 0;
	bottom: 16px;
	left: 0;
	font-size: 0;
	line-height: 8px;
	text-align: center
}

.store_banner_navigator .swiper-pagination-bullet {
	display: inline-block;
	width: 8px;
	height: 8px;
	margin: 0 3px;
	border-radius: 4px;
	background-color: rgba(255, 255, 255, 0.6);
	vertical-align: top
}

html[data-user-agent*="MSIE 8.0"] .store_banner_navigator .swiper-pagination-bullet
	{
	background-color: #fff
}

.store_banner_navigator .swiper-pagination-bullet.swiper-pagination-bullet-active
	{
	background-color: #1f9eff
}

.store_banner_previous, .store_banner_next {
	position: absolute;
	top: 50%;
	width: 44px;
	height: 80px;
	background-color: rgba(0, 0, 0, 0.15)
}

html[data-user-agent*="MSIE 8.0"] .store_banner_previous, html[data-user-agent*="MSIE 8.0"] .store_banner_next
	{
	background-color: #d9d9d9
}

html[data-user-agent*="MSIE 8.0"] .store_banner_previous:before, html[data-user-agent*="MSIE 8.0"] .store_banner_next:before
	{
	top: 0
}

.store_banner_previous:before, .store_banner_next:before {
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -17px 0 0 -9px;
	content: ''
}

.store_banner_previous {
	right: 50%;
	margin: -40px 526px 0 0
}

.store_banner_previous:before {
	background-position: -30px -583px;
	width: 18px;
	height: 34px
}

.store_banner_next {
	left: 50%;
	margin: -40px 0 0 526px
}

.store_banner_next:before {
	background-position: -4px -583px;
	width: 18px;
	height: 34px
}

.category_product_area {
	margin-top: 16px;
	padding: 0 30px 17px;
	font-size: 0;
	text-align: center
}

.category_product_item {
	display: inline-block;
	margin: 8px 0 0 8px
}

.category_product_item:first-child {
	margin-left: 0
}

.category_product_item:nth-child(8n+0) {
	margin-left: 0
}

.category_product_label {
	display: inline-block;
	min-width: 130px;
	height: 40px;
	padding: 1px 5px 0;
	border: 1px solid #cdcdcd;
	font-size: 16px;
	line-height: 37px
}

.category_product_label .text {
	font-size: 15px
}

.category_product_radio:checked+.category_product_label {
	border-color: #1d8ade;
	color: #1f9eff
}

.category_product_radio.is_checked+.category_product_label {
	border-color: #1d8ade;
	color: #1f9eff
}

.dim {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 100;
	background-color: #000;
	opacity: 0.7;
	filter: alpha(opacity = 70)
}

.ly_personal {
	position: fixed;
	top: 50%;
	left: 50%;
	z-index: 110;
	width: 400px;
	height: 480px;
	margin: -195px 0 0 -200px;
	padding: 34px 30px 0;
	border: solid 1px #ccc;
	background-color: #fff;
	font-family: '\B3CB\C6C0', Dotum, '\B9D1\C740\ACE0\B515',
		'malgun gothic', 'Apple SD Gothic Neo', Helvetica, sans-serif;
	text-align: center
}

.ly_personal .tit {
	font-family: '\B9D1\C740\ACE0\B515', 'malgun gothic',
		'Apple SD Gothic Neo', Helvetica, sans-serif;
	font-size: 24px;
	line-height: 32px;
	letter-spacing: -2px;
	color: #000
}

.ly_personal .tit .point {
	font-weight: normal;
	color: #7ea114
}

.ly_personal .cont {
	margin: 27px 0 0;
	padding: 27px 0 29px;
	border: solid #e5e5e5;
	border-width: 1px 0
}

.ly_personal .cont .txt {
	font-size: 17px;
	line-height: 23px;
	letter-spacing: -1.5px;
	color: #676767
}

.ly_personal .cont .txt .point {
	font-weight: normal;
	color: #000
}

.ly_personal .cont .btn_green {
	background-position: 0px 0px;
	width: 256px;
	height: 63px;
	display: block;
	margin: 15px auto 0;
	font-size: 0;
	text-indent: -9999px
}

.ly_personal .cont .txt_link {
	display: inline-block;
	margin-top: 20px;
	font-size: 11px;
	letter-spacing: -0.5px;
	text-decoration: underline;
	color: #888
}

.ly_personal .notice {
	margin-top: 27px;
	font-size: 11px;
	line-height: 16px;
	letter-spacing: -0.5px;
	color: #999898
}

.ly_personal .notice:before {
	background-position: -70px -67px;
	width: 11px;
	height: 11px;
	display: inline-block;
	margin: 0 5px 2px;
	vertical-align: middle;
	content: ''
}

.ly_personal .inp_chk {
	margin-top: 22px
}

.ly_personal .inp_chk input {
	position: static;
	width: auto;
	height: auto;
	margin: auto;
	vertical-align: middle;
	clip: auto;
	-webkit-appearance: checkbox;
	-moz-appearance: checkbox;
	appearance: checkbox
}

.ly_personal .inp_chk label {
	font-size: 12px;
	letter-spacing: -1px;
	vertical-align: middle;
	color: #929292;
	cursor: pointer
}

.ly_personal .btn_pop_clse {
	background-position: -30px -67px;
	width: 20px;
	height: 20px;
	position: absolute;
	top: 15px;
	right: 16px;
	text-indent: -9999px
}

.footer {
	position: relative;
	margin-top: 96px;
	padding-top: 52px;
	border-top: 1px solid #e0e0e0;
	background-clip: content-box;
	background-color: #f6f6f6
}

.footer:before {
	position: absolute;
	top: 51px;
	right: 0;
	left: 0;
	height: 1px;
	background-color: #e3e3e3;
	content: ''
}

.service_info_wrap {
	position: relative;
	width: 1140px;
	margin: -52px auto 0;
	padding: 16px 0 15px
}

.footer_info_wrap {
	position: relative;
	padding: 26px 0 42px;
	border-top: 1px solid #f0f0f0;
	background-color: #fff;
	font-size: 14px;
	color: #828282
}

.btn_service_info {
	position: relative;
	padding-right: 19px;
	font-size: 15px;
	font-weight: bold
}

.btn_service_info:after {
	background-position: -510px -515px;
	width: 12px;
	height: 7px;
	position: absolute;
	top: 50%;
	right: 0;
	margin-top: -4px;
	content: ''
}

.btn_service_info[aria-pressed='true']:after {
	background-position: -530px -515px
}

.service_info_inner {
	margin: 62px 0 30px
}

.service_info_inner:after {
	display: table;
	table-layout: fixed;
	clear: both;
	content: ''
}

.service_info_grid {
	float: left;
	position: relative;
	padding: 0 94px 0 195px;
	border-left: 1px solid #e3e3e3
}

.service_info_grid:first-child {
	padding-left: 133px;
	border-left: 0
}

.service_info_grid:first-child .service_info_title {
	left: 0
}

.service_info_title {
	position: absolute;
	top: 0;
	left: 84px;
	font-size: 15px;
	font-weight: bold
}

.service_info_item {
	margin-top: 13px;
	color: #828282
}

.service_info_item:first-of-type {
	margin-top: 0
}

.notice_wrap {
	position: absolute;
	top: 16px;
	left: 133px;
	font-size: 15px
}

.notice_wrap:after {
	display: table;
	table-layout: fixed;
	clear: both;
	content: ''
}

.notice_wrap .notice_title {
	float: left;
	font-weight: bold
}

.notice_wrap .notice_text {
	float: left;
	margin-left: 10px;
	color: #828282
}

.notice_wrap .icon_new {
	background-position: -237px -560px;
	width: 9px;
	height: 11px;
	display: inline-block
}

.footer_info_inner {
	width: 1140px;
	margin: 0 auto
}

.footer_info_list {
	margin-top: 18px
}

.footer_info_list:after {
	display: table;
	table-layout: fixed;
	clear: both;
	content: ''
}

.footer_info_item {
	float: left
}

.footer_info_item:before {
	display: inline-block;
	width: 1px;
	height: 12px;
	margin: 0 10px;
	background-color: #d7d7d7;
	vertical-align: -1px;
	content: ''
}

.footer_info_item:first-child:before {
	display: none
}

.footer_info_address {
	margin-top: 5px
}

.footer_info_notice {
	display: block;
	margin-top: 10px;
	font-size: 13px
}

.footer_info_copyright {
	margin-top: 18px;
	font-size: 13px
}

.footer_info_naver {
	margin-right: 7px
}

.btn_mobile {
	display: block;
	width: 100%;
	height: 59px;
	background-color: #f6f6f6;
	font-size: 16px;
	font-weight: bold;
	line-height: 59px;
	text-align: center;
	color: #666
}

.btn_mobile .icon_arrow {
	background-position: -550px -447px;
	width: 8px;
	height: 14px;
	display: inline-block;
	margin-top: 22px;
	margin-left: 5px;
	vertical-align: top
}
</style>
</head>
<body>
	<div class="u_skip">
		<a href="#header"><span>메뉴 바로가기</span></a> <a href="#slider_banner"><span>배너
				영역 바로가기</span></a> <a href="#content"><span>본문 바로가기</span></a>
	</div>
	<div class="wrap">
		<div role="banner" id="header" class="header"></div>
		<div id="slider_banner" class="slider_banner_wrap">
			<h2 class="blind">배너 영역</h2>
			<div class="slider_banner_inner">
				<ul class="slider_banner_list" id="sliderbanner"></ul>
				<div class="slider_banner_navigator"></div>
				<button type="button" class="slider_banner_previous">
					<span class="blind">이전 배너</span>
				</button>
				<button type="button" class="slider_banner_next">
					<span class="blind">다음 배너</span>
				</button>
			</div>
		</div>
		<div role="main" id="content" class="home_content">
			<div class="category_simple_wrap">
				<h3 class="blind">테마 카테고리</h3>
				<ul class="category_simple_list" id="homeCategory">
					<li class="category_simple_item"><a
						href="/donation/DonateHomeMain.nhn#theme=0"
						class="category_simple_link"><i class="theme_simple_icon0"></i>전체테마</a></li>
				</ul>
			</div>
			<div class="donation_card_wrap" id="rdonacards">
				<h3 class="blind">진행 중 모금함</h3>
				<a href="/donation/DonateHomeMain.nhn" class="card_donation"><span
					class="label_translucence">기부</span> <strong
					class="card_donation_htitle">당신의 참여가<br>변화의 시작입니다
				</strong> <span class="more_white" aria-label="진행 중 모금함 더보기">더보기</span>
					<dl class="card_donation_list">
						<dt class="card_donation_title">
							<i class="icon_people"></i>참여
						</dt>
						<dd class="card_donation_number">
							<span class="point" id="lines7">0</span>명
						</dd>
						<dt class="card_donation_title">
							<i class="icon_money"></i>기부금액
						</dt>
						<dd class="card_donation_number">
							<span class="point" id="lines8">0</span>원
						</dd>
					</dl></a>
			</div>
			<div class="double_card_wrap" id="doublecards">
				<h3 class="blind">더블기부 모금함</h3>
				<a href="/doubleproject" class="card_doublehome"><span
					class="label_translucence">더블기부</span> <strong
					class="card_doublehome_htitle">기부한 만큼<br>두 배로 응원합니다
				</strong> <span class="more_white" aria-label="더블기부 모금함 더보기">더보기</span>
					<dl class="card_doublehome_list">
						<dt class="card_doublehome_title">
							<i class="icon_people"></i>참여
						</dt>
						<dd class="card_doublehome_number">
							<span class="point" id="lines9">0</span>명
						</dd>
						<dt class="card_doublehome_title">
							<i class="icon_money"></i>기부금액
						</dt>
						<dd class="card_doublehome_number">
							<span class="point" id="lines10">0</span>원
						</dd>
					</dl></a>
			</div>
			<a target="_blank" id="event_banner" class="event_banner"
				style="display: none;"><img class="event_banner_img" width="750"
				height="130"></a>
			<div class="funding_card_wrap">
				<h3 class="blind">펀딩</h3>
				<a href="/crowdFunding/Home" class="card_fundinghome"><span
					class="label_translucence">펀딩</span><span
					class="label_translucence_long">공감가게</span> <strong
					class="card_fundinghome_htitle">가치 있는 소비가<br>세상을 바꾸는
						이들을<br>응원합니다
				</strong> <span class="more_white" aria-label="펀딩 더보기">더보기</span>
					<dl class="card_fundinghome_list">
						<dt class="card_fundinghome_title">
							<i class="icon_people"></i>참여
						</dt>
						<dd class="card_fundinghome_number">
							<span class="point" id="lines11">0</span>명
						</dd>
						<dt class="card_fundinghome_title">
							<i class="icon_money"></i>참여금액
						</dt>
						<dd class="card_fundinghome_number">
							<span class="point" id="lines12">0</span>원
						</dd>
					</dl></a>
				<div class="funding_card_inner" id="fundingcards"></div>
				<div class="funding_card_inner" id="flowerCards"></div>
			</div>
			<div class="good_card_wrap">
				<div class="good_card_inner">
					<h3 class="good_card_title">굿액션</h3>
					<p class="good_card_text">함께하는 행동이 좋은 기부문화를 만듭니다</p>
					<div class="good_card_area" id="goodcards"></div>
				</div>
			</div>
			<div class="campaign_card_wrap">
				<h3 class="campaign_card_title">캠페인</h3>
				<p class="campaign_card_text">해피빈은 기업 CSR활동을 함께 공유하고 공감합니다</p>
				<div class="campaign_card_area" id="campaigncards"></div>
				<a href="/campaignhome/Main" class="more" aria-label="캠페인 더보기">더보기</a>
			</div>
		</div>
		<div role="contentinfo" id="footer" class="footer"></div>
	</div>
	<script src="/dist/home.js?7214f696956ed43bdf83"></script>
</body>
</html>