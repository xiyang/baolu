$(document).ready(function () {
     totalPrice();
     modifyItem();
     modifyQuantity();
     //getCustomizeDate(); comment out by GaoFei on 2010-09-09
     $('#userMail').hide();
     $('#enquiryNumber').hide();
     initializeMail();
     $('#sendMail').click(function(){
         sendMail();
     });
     $('#addPaidButton').click(function(){
         addPaid();
     })
});
function totalPrice() {
     var totalPrice = parseFloat("0");
     $(".quantity").each(function () {
         totalPrice =  totalPrice + parseFloat($(this).val()*$(this).next().val());
     });
     $('#price').text(totalPrice);
}

function generateOrder() {
    if ($('#mprice').val()==''){
      $("#message").html($("#orderProductPrice").val());
        return ;
    }
	$('#orderForm').submit();
}

function deleteOrder(){
    var answer = confirm("Are you sure to delete?")
    var id = $('#orderId').val();
    if (answer)location.href = path + "/admin/order/delete/" +id;
}
function cancelOrder(){
    var answer = confirm("确定取消订单？")
    var id = $('#orderId').val();
    if (answer)location.href = path + "/admin/order/cancel/" +id;
}
function modifyItem(){
    $('.item').each(function(){
        $(this).click(function (){
           var obj = $(this).parent().next().children(".quantity");
           if (!this.checked) {
               obj.val(0);
               obj[0].readOnly=true;
           }
           else {
               obj[0].readOnly=false;
           }
            totalPrice();
         });
    })
}

function modifyQuantity(){
    $('.quantity').each(function(){
        $(this).keyup(function(){
            totalPrice();
        })
    });
}
function validationInputNumber(event){   
    var key =  event.keyCode ;   
    if ((event.ctrlKey || event.shiftKey)||key ==32 ||(key > 57 && key <96) ||key >106){   
        if(navigator.userAgent.indexOf("Firefox")>0) {   
           event.preventDefault();     
        }   
        else {   
             event.returnValue=false;   
             }   
    }   
}

function getCustomizeDate(){
    $('#projectId').hide();
    var id = $('#projectId').val();
    if (id =='') return ;
    jQuery.getJSON(customizeProjectDetailPath+id+"&jsoncallback=?");
}

function jsonCallback(data) {
   
    jQuery.each(data.experimentModelList, function(i,item){
         if (i == 0) {
            jQuery("#customize").append("<tr><th>Experiment</th><th>Status</th></tr>");
        }
        jQuery("#customize").append("<tr><td>"+item. experimentName+"</td><td>"+item.state+"</td></tr>");
  });
}  

function initializeMail(){
    var email = $('#userMail').text();
    var enquiryNumber = $('#enquiryNumber').text();
    var orderId = $('#orderId').val();
    $("#mailInput").val(email);
    $("#enquiryNumberInput").val(enquiryNumber);
    $("#orderIdInput").val(orderId);
}

function sendMail(){
    var comments=$('#comments').val();
    $("#commentsInput").val(comments);
    $("#mailForm").submit();
}

function addPaid(){
    var paid = $('#addPaid').val();
    var orderId = $('#orderId').val();
    $('#paidId').val(orderId);
    $('#paidPrice').val(paid);
    $('#paidForm').submit();
}

function changeStatus(){
	
	var status = $("#status").val();
    document.location.href = path + "/admin/order/changeStatus?status="+status+"&orderId="+$("#orderId").val();
}
