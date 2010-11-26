<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
	<head>
		<style language="text/css">
			.borderBottomForEmpty {
				border-bottom: #bcbcbc 1px solid;
			}
			.notUnderline {
				text-decoration: none;
			}
			.evenTR {background-color: #eeeeee;}
			.cellTd {padding: 5px 5px;}
			.categoryTd {border-top: 1px solid #BCBCBC;}
			.elementTitle {font-weight: bold;}
			#productTitle {text-align: center;margin-top: 20px;}
			#productTitle .title {font-weight: bolder;}
			#productTitle .subTitle {font-size: 12px;}
			#productContent {margin: 20px 0px;padding-bottom: 10px;}
			.transverseText td{border-bottom: 1px solid #BCBCBC;padding-bottom: 15px;padding-top: 15px;padding-right: 15px;}
			#product td {vertical-align: top;}
			.pdffoot {height: 45px;text-align: center;}
			.imgBorder {
				border:1px solid #807F85;
				cursor:pointer;
				text-align:center;
				height:150px;
				width:150px;
				display:table-cell;
				line-height:150px;
				vertical-align:middle;
			}
			.firstTr {background-color:#F6AE3C;color:#FFFFFF;font-size:12px;font-weight:bolder;height:24px;text-align:center;}
			.evenTR {background-color:#F1F1F1;}
			#legendInfoList tr th, tr td {height: 25px;text-align: left;}
			
			 @media print {  
	             div.footer-left {  
	                 display: block;  
	                 position: running(footer-center);  
	             }
	             
	             div.footer-right {  
	                 display: block;  
	                 position: running(footer-right);  
             	}    
         	}  
   
	        @page {
	        	 margin-bottom: 150px;
	        	 margin-top: 50px;	  
	             @bottom-center {content: element(footer-center)};
	             @bottom-right {content: element(footer-right)};  
	        }  
   
   			#pagenumber:before {  
             	content: counter(page);  
         	}  
   
         	#pagecount:before {  
             	content: counter(pages);  
         	} 
		</style>
		
	</head>
	<body>
		<div id="footer-left" class="footer-left pdffoot" align="center">
				<span style="padding: 20px 0px;font-size: 10px;">ABGENT&nbsp;&nbsp;INC.,&nbsp;&nbsp;10239&nbsp;&nbsp;FLANDERS&nbsp;&nbsp;COURT,&nbsp;&nbsp;SAN&nbsp;&nbsp;DIEGO,&nbsp;&nbsp;CA&nbsp;&nbsp;92121</span><br />
				<span style="font-size: 10px;">TEL&nbsp;&nbsp;858-622-0099&nbsp;&nbsp;FAX&nbsp;&nbsp;858-622-0609&nbsp;&nbsp;WWW.ABGENT.COM&nbsp;&nbsp;INFO@ABGENT.COM</span>
		</div>
		<div id="footer-right" class="footer-right" align="right">&nbsp;<span id="pagenumber" /></div>
		<div>
			<table id="titleTable">
				<tr>
					<td><img src="${pageContext.request.contextPath}/images/logo.gif"/></td>
						<!--<td>
							<span style="padding-left: 10px; font-weight: bold;font-size: 12px;display: block;">10239 Flanders Court, San Diego, CA 92121, USA. <a href="mailto:tech@abgent.com" class="hand underLine">sales@abgent.com</a> <br /> Tel: 858.622.0099, 888-735-7227&nbsp;(US toll free) Fax: 858-622-0609&nbsp;(US toll free) </span>
						</td>-->
				</tr>
			</table>
		</div>
		<div id="productTitle">
				<div>
					<span class="title">${product.title}</span>
				</div>
				<div style="margin-top: 5px;">
					<span class="subTitle">${product.subTitle}</span>
				</div>
		</div>
		<div id="productContent" >
			<table id="product" cellpadding="0" cellspacing="0" style="width: 100%;">
				<tr>
					<td>
						<jsp:include page="./template/${targetView}-pdf.jsp"></jsp:include>
					</td>
				</tr>
			</table>
		</div>
			
	</body>
</html>