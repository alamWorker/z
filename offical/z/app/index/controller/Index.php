<?php
namespace app\index\controller;

use app\common\controller\Base;

class Index extends Base
{
    public function index()
    {
    	$this->redirect('/workclass/View/show_schedule');
        return '<title>I can,so I do and so do you.</title><style type="text/css">*{ padding: 0; margin: 0; } .think_default_text{ padding: 4px 48px;} a{color:#2E5CD5;cursor: pointer;text-decoration: none} a:hover{text-decoration:underline; } body{ background: #fff; font-family: "Century Gothic","Microsoft yahei"; color: #333;font-size:18px} h1{ font-size: 100px; font-weight: normal; margin-bottom: 12px; } p{ line-height: 1.6em; font-size: 42px }</style>
		<div style="padding: 24px 48px;">
		<h1>:)</h1>
		<p> I can do what you need. <br/><span style="font-size:30px">although I don\'t know what I can do.</span></p>
		</div>
		<script>
		setTimeout(function(){window.location.href="/workclass/View/show_schedule";},1000);
		</script>';
    }
}
