/*
 * @Author: wkiwi
 * @Email: w_kiwi@163.com
 * @Date: 2018-12-02 17:22:05
 * @LastEditors: wkiwi
 * @LastEditTime: 2018-12-02 18:27:14
 */


$(function(){
  app.confirmDelete();
})

var app={

  toggle:function(el,collectionName,attr,id){//直接切换状态
      $.get('/admin/changeType',{collectionName:collectionName,attr:attr,id:id},function(data){
        if(data.success){
          if($(el).hasClass('btn-info')){
              $(el).removeClass('btn-info').addClass("btn-warning");
              $(el).find('i').removeClass('fa-check').addClass("fa-times")
          } else {
              $(el).addClass('btn-info').removeClass("btn-warning");
              $(el).find('i').addClass('fa-check').removeClass("fa-times");
          }
        }
      })
  },
  forbidden:function(el,collectionName,attr,id){ //禁用或者启用
      $.get('/admin/changeType',{collectionName:collectionName,attr:attr,id:id},function(data){
        if(data.success){
          if($(el).find('a')[0].innerHTML=="禁用"){
            $(el).find('a')[0].innerHTML="启用"
          } else {
            $(el).find('a')[0].innerHTML="禁用"
          }
        }
      })
  },
  confirmDelete:function(){
      console.log(123)
      $(".delete").click(function(){
          console.log(123)
          var flag=confirm("你确定要删除吗？")
          return flag;
      })
  },
  changeSort:function(el,collectionName,id){
      var sortValue=el.value;
      $.get('/admin/changeSort',{collectionName:collectionName,id:id,sortValue:sortValue},function(data){
          console.log(data)
      })
  }

}
