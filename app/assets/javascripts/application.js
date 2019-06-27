// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require cocoon
//= require activestorage
//= require_tree .


$(function(){


  // ヘッダーメニューの表示・非表示
  $(".show_header_menu").click(function(){
    $("#header_menu").slideToggle();
    if($(this).hasClass("hide")){
      $(this).html("<i class='fas fa-bars'></i>");
      $(this).removeClass("hide");
      $("#header_menu_back").hide();
    } else {
      $(this).html("<i class='fas fa-times'></i>");
      $(this).addClass("hide");
      $("#header_menu_back").show();
    }
  });

  $("#header_menu_back").click(function(){
    $(".show_header_menu").html("<i class='fas fa-bars'></i>");
    $(".show_header_menu").removeClass("hide");
    $("#header_menu").slideUp();
    $("#header_menu_back").hide();
  });


  // flashメッセージの表示からフェードアウトまで
  $("#success").animate({right: 0}, 1000);
  $("#success").delay(1500).fadeOut(1000);

  // エラーメッセージ
  $("#flash_field #close").click(function (){
    $("#flash_field").slideUp();
  });



  //catchの追加要素を選択するやつ(ページ読み込み後に追加した要素を利用するためにはdocumentメソッドを使う必要がある。)
  $(document).on("click", ".code_name_btn", function(){
    $(this).parents(".nested-fields").find(".code_name").slideToggle();
    if($(this).hasClass("there")){
      $(this).parents(".nested-fields").find(".code_name").val("");
      $(this).css({"background":"#263238", "color":"rgb(0,255,255,1)", "border":"1px solid rgba(0,255,255,1)"});
      $(this).html("<i class='fas fa-heading'></i>");
      $(this).removeClass("there");
    } else {
      $(this).parents(".nested-fields").find(".code_name").focus();
      $(this).css({"background":"rgba(0,255,255,1)", "color":"#263238", "border":"none"});
      $(this).html("<i class='fas fa-heading'></i>");
      $(this).addClass("there");
    }
  });

  $(document).on('click', '.code_source_btn', function(){
    $(this).parents(".nested-fields").find(".code_source").slideToggle();
    if($(this).hasClass("there")){
      $(this).parents(".nested-fields").find(".code_source").val("");
      $(this).css({"background":"#263238", "color":"rgb(0,255,255,1)", "border":"1px solid rgba(0,255,255,1)"});
      $(this).html("<i class='fas fa-code'></i>");
      $(this).removeClass("there");
    } else {
      $(this).parents(".nested-fields").find(".code_source").focus();
      $(this).css({"background":"rgba(0,255,255,1)", "color":"#263238", "border":"none"});
      $(this).html("<i class='fas fa-code'></i>");
      $(this).addClass("there");
    }
  });

  $(document).on('click', '.code_description_btn', function(){
    $(this).parents(".nested-fields").find(".code_description").slideToggle();
    if($(this).hasClass("there")){
      $(this).parents(".nested-fields").find(".code_description").val("");
      $(this).css({"background":"#263238", "color":"rgb(0,255,255,1)", "border":"1px solid rgba(0,255,255,1)"});
      $(this).html("<i class='far fa-comment-alt'></i>");
      $(this).removeClass("there");
    } else {
      $(this).parents(".nested-fields").find(".code_description").focus();
      $(this).css({"background":"rgba(0,255,255,1)", "color":"#263238", "border":"none"});
      $(this).html("<i class='far fa-comment-alt'></i>");
      $(this).addClass("there");
    }
  });

  $(document).on('click', '.code_url_btn', function(){
    $(this).parents(".nested-fields").find(".code_url").slideToggle();
    if($(this).hasClass("there")){
      $(this).parents(".nested-fields").find(".code_url").val("");
      $(this).css({"background":"#263238", "color":"rgb(0,255,255,1)", "border":"1px solid rgba(0,255,255,1)"});
      $(this).html("<i class='fas fa-link'></i>");
      $(this).removeClass("there");
    } else {
      $(this).parents(".nested-fields").find(".code_url").focus();
      $(this).css({"background":"rgba(0,255,255,1)", "color":"#263238", "border":"none"});
      $(this).html("<i class='fas fa-link'></i>");
      $(this).addClass("there");
    }
  });


  //codeの選択済みの状態で項目をhoverしたときに×を表示させる
  $(document).on({
    "mouseenter": function(){ if($(this).hasClass("there")){ $(this).html("<i class='fas fa-times'></i>"); } },
    "mouseleave": function(){ if($(this).hasClass("there")){ $(this).html("<i class='fas fa-heading'></i>"); } }
  }, ".code_name_btn");

  $(document).on({
    "mouseenter": function(){ if($(this).hasClass("there")){ $(this).html("<i class='fas fa-times'></i>"); } },
    "mouseleave": function(){ if($(this).hasClass("there")){ $(this).html("<i class='fas fa-code'></i>"); } }
  }, ".code_source_btn");

  $(document).on({
    "mouseenter": function(){ if($(this).hasClass("there")){ $(this).html("<i class='fas fa-times'></i>"); } },
    "mouseleave": function(){ if($(this).hasClass("there")){ $(this).html("<i class='far fa-comment-alt'></i>"); } }
  }, ".code_description_btn");

  $(document).on({
    "mouseenter": function(){ if($(this).hasClass("there")){ $(this).html("<i class='fas fa-times'></i>"); } },
    "mouseleave": function(){ if($(this).hasClass("there")){ $(this).html("<i class='fas fa-link'></i>"); } }
  }, ".code_url_btn");




  // PICKボタンを押したらマイレシピをフェードインさせる
  $("#pick_btn").on("click", function(){
    $("#mysystem_wrapper").fadeIn();
    $("#mysystem").fadeIn();
  });
  // #mysystem_wrapperをクリックしたらマイレシピをフェードアウトさせる
  $("#mysystem_wrapper").on("click", function(){
    $("#mysystem_wrapper").fadeOut();
    $("#mysystem").fadeOut();
  });



  // systems/showでblock名をクリックしたらblockの内容をスライド表示または非表示
  $(".block_top .slide_icon, .block_top .name").on("click", function(){
    $(this).parents(".block_top").find(".description").slideToggle();
    $(this).parents(".block").find(".block_childs").slideToggle();
    if($(this).parents(".block_top").find(".slide_icon").hasClass("there")){
      $(this).parents(".block_top").find(".slide_icon").html("<i class='fas fa-sort-down'></i>");
      $(this).parents(".block_top").find(".slide_icon").removeClass("there");
    } else {
      $(this).parents(".block_top").find(".slide_icon").html("<i class='fas fa-sort-up'></i>");
      $(this).parents(".block_top").find(".slide_icon").addClass("there");
    }
  });




  // carrierwave(画像アップローダー)のプレビュー表示
  $(document).on("change", ":file", function() {
    var input = $(this);
    var files = !!this.files ? this.files : [];
    if (!files.length || !window.FileReader) return; // ファイルが選択されていない、ファイルリーダーがサポートされていない場合はリターン
    if (/^image/.test( files[0].type)){ // 画像ファイルだけ許可
      var reader = new FileReader(); // ファイルリーダーのインスタンスを作成
      reader.readAsDataURL(files[0]); // 画像を読み込む
      reader.onloadend = function(){ // divの背景画像として読み込んだ画像をセット
        if (!input.hasClass("code_image")) {
          // 普通の画像の場合
          input.parents(".field").find(".imagePreview").css("height", "300px");
          input.parents(".field").find(".imagePreview").css("background-image", "url("+this.result+")");
          input.parents(".field").find(".imagePreview").children("img").css("display", "none");
          input.parents(".field").find(".remove_label").show();
          input.parents(".field").find(".remove_image_btn").prop("checked", false);
        } else {
          // codeフィールドの画像の場合
          input.parents(".nested-fields").find(".imagePreview").css("height", "300px");
          input.parents(".nested-fields").find(".imagePreview").css("background-image", "url("+this.result+")");
          input.parents(".nested-fields").find(".imagePreview").children("img").css("display", "none");
          input.parents(".code_image_btn").css({"background":"rgba(0,255,255,1)", "color":"#263238"});
          input.parents(".nested-fields").find(".remove_label").show();
          input.parents(".nested-fields").find(".remove_image_btn").prop("checked", false);
        }
      }
    }
  });

  // 画像削除ボタンをクリックしたとき、プレビュー画像を非表示にする。
  $(document).on('change','.remove_image_btn',function(){
    if ($(this).prop('checked')) {
      if (!$(this).hasClass("code_image")) {
        // 普通の画像の場合
        $(this).parents(".field").find(".imagePreview").css("height", "0");
        $(this).parents(".remove_label").hide();
      } else {
        // codeフィールドの画像の場合
        $(this).parents(".field").find(".imagePreview").css("height", "0");
        $(this).parents(".remove_label").hide();
        $(this).parents(".nested-fields").find(".code_image_btn").css({"background":"#263238", "color":"rgba(0,255,255,1)", "border":"0.5px solid rgba(0,255,255,1)"});
      }
    }
  });



  //ユーザー編集画面でのパスワード変更の表示・非表示
  $("#password_change_btn").click(function(){
    $("#password_change_field").slideToggle();
    if($(this).hasClass("hide")){
      $(this).html("パスワード変更 <i class='fas fa-angle-down'></i>");
      $(this).removeClass("hide");
      $("#password").val("");
      $("#password_confirmation").val("");
    } else {
      $(this).html("キャンセル <i class='fas fa-angle-up'></i>");
      $(this).addClass("hide");
    }
  });


});



