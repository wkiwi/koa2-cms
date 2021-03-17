-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2021-03-16 12:52:50
-- 服务器版本： 5.5.59-log
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `koa`
--

-- --------------------------------------------------------

--
-- 表的结构 `adv`
--

CREATE TABLE IF NOT EXISTS `adv` (
  `id` int(10) unsigned NOT NULL COMMENT '主键',
  `title` char(255) NOT NULL DEFAULT '' COMMENT '链接名称',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `pic` char(255) NOT NULL DEFAULT '' COMMENT '链接主图',
  `link` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='广告链接';

--
-- 转存表中的数据 `adv`
--

INSERT INTO `adv` (`id`, `title`, `sort`, `pic`, `link`, `type`) VALUES
(1, 'wkiwi的博客', 0, 'upload/1545297644269.jpg', 'https://blog.bemcss.com', 1),
(2, 'wkiwi的博客', 0, 'upload/1562144015023.jpg', 'https://blog.bemcss.com', 1),
(3, 'wkiwi的博客', 0, 'upload/1562144029802.jpg', 'https://blog.bemcss.com', 1),
(4, 'wkiwi的博客', 0, 'upload/1562144042111.jpg', 'https://blog.bemcss.com', 1),
(5, 'wkiwi的博客', 0, 'upload/1562144058096.jpg', 'https://blog.bemcss.com', 1);

-- --------------------------------------------------------

--
-- 表的结构 `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id` int(10) unsigned NOT NULL COMMENT '主键',
  `classify` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '文章标题',
  `author` char(100) NOT NULL DEFAULT '' COMMENT '作者',
  `copyright` char(100) NOT NULL DEFAULT '' COMMENT '版权',
  `keywords` char(100) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` char(255) NOT NULL DEFAULT '' COMMENT '文章描述',
  `thumbnail` char(255) NOT NULL DEFAULT '' COMMENT '缩略图(新增)',
  `recommend` char(100) NOT NULL DEFAULT '' COMMENT '推荐分类',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '文章内容',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `read_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '阅读权限（参阅用户类型）',
  `create_time` char(30) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发表时间',
  `update_time` char(30) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `article_extend` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '扩展信息',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论量',
  `praise` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞量'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='文章数据库表';

--
-- 转存表中的数据 `article`
--

INSERT INTO `article` (`id`, `classify`, `user_id`, `title`, `author`, `copyright`, `keywords`, `description`, `thumbnail`, `recommend`, `content`, `type`, `read_type`, `create_time`, `update_time`, `article_extend`, `hits`, `comment`, `praise`) VALUES
(1, 0, 3, '你须知道的30个CSS选择器', 'wkiwi', 'wkiwi', 'html,css', '你也许已经掌握了id、class、后台选择器这些基本的css选择器。但这远远不是css的全部。下面向大家系统的解析css中30个最常用的选择器，包括我们最头痛的浏览器兼容性问题。掌握了它们，才能真正领略css的巨大灵活性。', '', '1,2,3', '<p>你也许已经掌握了id、class、后台选择器这些基本的css选择器。但这远远不是css的全部。下面向大家系统的解析css中30个最常用的选择器，包括我们最头痛的浏览器兼容性问题。掌握了它们，才能真正领略css的巨大灵活性。</p><p><br/></p><p>1. *</p><p><br/></p><p>* {</p><p>&nbsp; &nbsp; margin: 0;&nbsp;</p><p>&nbsp; &nbsp; padding: 0;</p><p>}</p><p>&nbsp;</p><p><br/></p><p>*选择符也可以在子选择器中使用。星状选择符会在页面上的每一个元素上起作用。web设计者经常用它将页面中所有元素的margin和padding设置为0。</p><p><br/></p><p>#container * {&nbsp;</p><p>&nbsp; &nbsp; border: 1px solid black;</p><p>}</p><p>&nbsp;</p><p><br/></p><p>上面的代码中会应用于id为container元素的所有子元素中。</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>除非必要，我不建议在页面中过的的使用星状选择符，因为他的作用域太大，相当耗浏览器资源。</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>兼容浏览器：IE6+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>2. #X</p><p><br/></p><p>#container {</p><p>&nbsp; &nbsp; width: 960px;</p><p>&nbsp; &nbsp; margin: auto;&nbsp;</p><p>}</p><p>&nbsp;</p><p><br/></p><p>井号作用域有相应id的元素。id是我们最常用的css选择器之一。id选择器的优势是精准，高优先级（优先级基数为100，远高于class的10），作为javascript脚本钩子的不二选择，同样缺点也很明显优先级过高，重用性差，所以在使用id选择器前，我们最好问下自己，真的到了非用id选择器的地步？</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>兼容浏览器：IE6+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>3. .X</p><p><br/></p><p><br/></p><p><br/></p><p>.error {</p><p>&nbsp; &nbsp; color: red;</p><p>}</p><p><br/></p><p><br/></p><p>这是一个class(类)选择器。class选择器与id选择器的不同是class选择器能作用于期望样式化的一组元素。</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>兼容浏览器：IE6+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>4. X Y</p><p><br/></p><p><br/></p><p><br/></p><p>li a {&nbsp;</p><p>&nbsp; &nbsp; text-decoration: none;</p><p>}</p><p>这也是我们最常用的一种选择器——后代选择器。用于选取X元素下子元素Y，要留意的点是，这种方式的选择器将选取其下所有匹配的子元素，无视层级，所以有的情况是不宜使用的，比如上述的代码去掉li下的所有a的下划线，但li里面还有个ul，我不希望ul下的li的a去掉下划线。使用此后代选择器的时候要考虑是否希望某样式对所有子孙元素都起作用。这种后代选择器还有个作用，就是创建类似命名空间的作用。比如上述代码样式的作用域明显为li。</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>兼容浏览器：IE6+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>5. X</p><p><br/></p><p><br/></p><p><br/></p><p>a {&nbsp;</p><p>&nbsp; &nbsp; color: red;&nbsp;</p><p>}&nbsp;&nbsp;</p><p>ul {&nbsp;</p><p>&nbsp; &nbsp; margin-left: 0;&nbsp;</p><p>}</p><p><br/></p><p><br/></p><p>标签选择器。使用标签选择器作用于作用域范围内的所有对应标签。优先级仅仅比*高。</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>兼容浏览器：IE6+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>6. X:visited和X:link</p><p><br/></p><p>a:link {&nbsp;</p><p>&nbsp; &nbsp; color: red;&nbsp;</p><p>}&nbsp;&nbsp;</p><p>&nbsp;</p><p>a:visted {&nbsp;</p><p>&nbsp; &nbsp; color: purple;&nbsp;</p><p>}</p><p><br/></p><p><br/></p><p>使用:link伪类作用于未点击过的链接标签。:hover伪类作用于点击过的链接。</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>兼容浏览器：IE7+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>7. X+Y</p><p><br/></p><p><br/></p><p>ul + p {</p><p>&nbsp; &nbsp; color: red;</p><p>}</p><p><br/></p><p>相邻选择器，上述代码中就会匹配在ul后面的第一个p，将段落内的文字颜色设置为红色。(只匹配第一个元素)</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>兼容浏览器：IE7+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>8. X&gt;Y</p><p><br/></p><p><br/></p><p><br/></p><p>div#container &gt; ul {&nbsp;</p><p>&nbsp; &nbsp; border: 1px solid black;</p><p>}</p><p><br/></p><p><br/></p><p>&lt;div id=”container”&gt;</p><p>&nbsp; &nbsp; &lt;ul&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &lt;li&gt; List Item</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;ul&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;li&gt; Child &lt;/li&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;/ul&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &lt;/li&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &lt;li&gt; List Item &lt;/li&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &lt;li&gt; List Item &lt;/li&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &lt;li&gt; List Item &lt;/li&gt;</p><p>&nbsp; &nbsp; &lt;/ul&gt;</p><p>&lt;/div&gt;</p><p><br/></p><p>子选择器。与后代选择器X Y不同的是，子选择器只对X下的直接子级Y起作用。在上面的css和html例子中，div#container&gt;ul仅对container中最近一级的ul起作用。从理论上来讲X &gt; Y是值得提倡选择器，可惜IE6不支持。</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>兼容浏览器：IE7+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>9. X ~ Y</p><p><br/></p><p><br/></p><p>ul ~ p {&nbsp;</p><p>&nbsp; &nbsp; color: red;</p><p>}</p><p><br/></p><p>相邻选择器，与前面提到的X+Y不同的是，X~Y匹配与X相同级别的所有Y元素，而X+Y只匹配第一个。</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>兼容浏览器：IE7+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>10. X[title]</p><p><br/></p><p><br/></p><p>a[title] {&nbsp;</p><p>&nbsp; &nbsp; color: green;</p><p>}</p><p><br/></p><p>属性选择器。比如上述代码匹配的是带有title属性的链接元素。</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>兼容浏览器：IE7+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>11. X[title=”foo”]</p><p><br/></p><p><br/></p><p><br/></p><p>a[href=&quot;http://kiwifruits.cn&quot;] {&nbsp;</p><p>&nbsp; &nbsp;color: #1f6053;&nbsp;</p><p>}</p><p><br/></p><p>属性选择器。 上面的代码匹配所有拥有href属性，且href为http://kiwifruits.cn的所有链接。</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>这个功能很好，但是多少又有些局限。如果我们希望匹配href包含css9.net的所有链接该怎么做呢？看下一个选择器。</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>兼容浏览器：IE7+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>12. X[href*=”moocss”]</p><p><br/></p><p><br/></p><p>a[href*=&quot;moocss&quot;] {color: #1f6053;}</p><p><br/></p><p>属性选择器。正如我们想要的，上面代码匹配的是href中包含”http://blog.moocss.com“的所有链接。</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>兼容浏览器：IE7+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>13. X[href^=”http”]</p><p><br/></p><p><br/></p><p>a[href^=&quot;http&quot;] {background: url(path/to/external/icon.png) no-repeat; padding-left: 10px;}</p><p><br/></p><p>属性选择器。上面代码匹配的是href中所有以http开头的链接。</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>兼容浏览器：IE7+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>14. X[href$=”.jpg”]</p><p><br/></p><p><br/></p><p>a[href^=&quot;http&quot;] { background: url(path/to/external/icon.png) no-repeat;padding-left: 10px;}</p><p><br/></p><p>属性选择器。在属性选择器中使用$，用于匹配结尾为特定字符串的元素。在上面代码中匹配的是所有链接到扩展名为.jpg图片的链接。（注意，这里仅仅是.jpg图片，如果要作用于所有图片链接该怎么做呢，看下一个选择器。）</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>兼容浏览器：IE7+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>15. X[data-*=”foo”]</p><p><br/></p><p>在上一个选择器中提到如何匹配所有图片链接。如果使用X[href$=”.jpg”]实现，需要这样做：</p><p><br/></p><p>&nbsp;</p><p>a[href$=&quot;.jpg&quot;],a[href$=&quot;.jpeg&quot;],a[href$=&quot;.png&quot;],a[href$=&quot;.gif&quot;] {</p><p>&nbsp; &nbsp; color: red;</p><p>}</p><p><br/></p><p>看上去比较麻烦。另一个解决办法是为所有的图片链接加一个特定的属性，例如‘data-file’</p><p><br/></p><p>&nbsp;</p><p>html代码</p><p><br/></p><p><br/></p><p>css代码如下：</p><p><br/></p><p><br/></p><p>a[data-filetype=&quot;image&quot;]{&nbsp;</p><p>&nbsp; &nbsp; &nbsp;color: red;</p><p>}</p><p><br/></p><p>这样所有链接到图片的链接字体颜色为红色。</p><p><br/></p><p><br/></p><p>兼容浏览器：IE7+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p><br/></p><p>16. X[foo~=”bar”]</p><p><br/></p><p>属性选择器。属性选择器中的波浪线符号可以让我们匹配属性值中用空格分隔的多个值中的一个。看下面例子：</p><p><br/></p><p><br/></p><p>html代码</p><p><br/></p><p><br/></p><p>&lt;a href=”path/to/image.jpg” data-info=”external image”&gt; Click Me, Fool &lt;/a&gt;</p><p><br/></p><p>css代码</p><p><br/></p><p>a[data-info~=&quot;external&quot;] {</p><p>&nbsp; &nbsp; color: red;</p><p>}</p><p>a[data-info~=&quot;image&quot;] {</p><p>&nbsp; &nbsp; border: 1px solid black;</p><p>}</p><p><br/></p><p>在上面例子中，匹配data-info属性中包含“external”链接的字体颜色为红色。匹配data-info属性中包含“image”的链接设置黑色边框。</p><p><br/></p><p><br/></p><p>兼容浏览器：IE7+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p><br/></p><p>17. X:checked</p><p><br/></p><p>checked伪类用来匹配处于选定状态的界面元素，如radio、checkbox。</p><p><br/></p><p>input[type=radio]:checked {</p><p>&nbsp; &nbsp; border: 1px solid black;</p><p>}</p><p><br/></p><p>上面代码中匹配的是所有处于选定状态的单选radio，设置1px的黑色边框。</p><p><br/></p><p><br/></p><p>兼容浏览器：IE9+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p><br/></p><p>18. X:after和X:before</p><p><br/></p><p>这两个伪类与content结合用于在元素的前面或者后面追加内容，看一个简单的例子：</p><p><br/></p><p><br/></p><p>h1:after {</p><p>&nbsp; &nbsp; content:url(/i/logo.gif)</p><p>}</p><p><br/></p><p>上面的代码实现了在h1标题的后面显示一张图片。</p><p><br/></p><p><br/></p><p>我们也经常用它来实现清除浮动，写法如下：</p><p><br/></p><p><br/></p><p>.clearfix:after {</p><p>&nbsp; &nbsp; content: “”;</p><p>&nbsp; &nbsp; display: block;</p><p>&nbsp; &nbsp; clear: both;</p><p>&nbsp; &nbsp; visibility: hidden;</p><p>&nbsp; &nbsp; font-size: 0;</p><p>&nbsp; &nbsp; height: 0;</p><p>}&nbsp; &nbsp; &nbsp;&nbsp;</p><p>.clearfix {</p><p>&nbsp; &nbsp; *zoom:1</p><p>}</p><p><br/></p><p>19. X:hover</p><p><br/></p><p>div:hover {</p><p>&nbsp; &nbsp; background: #e3e3e3;</p><p>}</p><p><br/></p><p>:hover伪类设定当鼠标划过时元素的样式。上面代码中设定了div划过时的背景色。</p><p><br/></p><p><br/></p><p>需要注意的是，在ie 6中，:hover只能用于链接元素。</p><p><br/></p><p><br/></p><p>这里分享一个经验，在设定链接划过时出现下滑线时，使用border-bottom会比text-decoration显得更漂亮些。代码如下：</p><p><br/></p><p>a:hover {</p><p>&nbsp; &nbsp; border-bottom: 1px solid black;</p><p>}</p><p><br/></p><p>兼容浏览器：IE6+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p><br/></p><p>20. X:not(selector)</p><p><br/></p><p>div:not(#container) {</p><p>&nbsp; &nbsp; color: blue;</p><p>}</p><p><br/></p><p>否定伪类选择器用来在匹配元素时排除某些元素。在上面的例子中，设定除了id为container的div元素字体颜色为blue。</p><p><br/></p><p><br/></p><p>兼容浏览器：IE9+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p><br/></p><p>21. X::pseudoElement</p><p><br/></p><p>::伪对象用于给元素片段添加样式。比如一个段落的第一个字母或者第一行。需要注意的是，这个::伪对象只能用于块状元素。</p><p><br/></p><p><br/></p><p>下面的代码设定了段落中第一个字母的样式：</p><p><br/></p><p><br/></p><p>p::first-letter {</p><p>&nbsp; &nbsp; float: left;</p><p>&nbsp; &nbsp; font-size: 2em;</p><p>&nbsp; &nbsp; font-weight: bold;</p><p>&nbsp; &nbsp; font-family: cursive;</p><p>&nbsp; &nbsp; padding-right: 2px;</p><p>}</p><p><br/></p><p>下面的代码中设定了段落中第一行的样式：</p><p><br/></p><p>&nbsp;</p><p>p::first-line {</p><p>&nbsp; &nbsp; font-weight: bold;</p><p>&nbsp; &nbsp; font-size: 1.2em;</p><p>}</p><p><br/></p><p>兼容浏览器：IE6+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p><br/></p><p>（IE6竟然支持，有些意外啊。）</p><p><br/></p><p><br/></p><p>22. X:nth-child(n)</p><p><br/></p><p><br/></p><p>li:nth-child(3) {</p><p>&nbsp; &nbsp; color: red;</p><p>}</p><p><br/></p><p>这个伪类用于设定一个序列元素（比如li、tr）中的第n个元素（从1开始算起）的样式。在上面例子中，设定第三个列表元素li的字体颜色为红色。</p><p><br/></p><p>&nbsp;</p><p><br/></p><p>看一个更灵活的用法，在下面例子中设定第偶数个元素的样式，可以用它来实现隔行换色：</p><p><br/></p><p><br/></p><p>tr:nth-child(2n) {</p><p>&nbsp; &nbsp; background-color: gray;</p><p>}</p><p><br/></p><p>兼容浏览器：IE9+、Firefox、Chrome、Safari</p><p><br/></p><p><br/></p><p>23. X:nth-last-child(n)</p><p><br/></p><p><br/></p><p>li:nth-last-child(2) {</p><p>&nbsp; &nbsp; color: red;</p><p>}</p><p><br/></p><p>与X:nth-child(n)功能类似，不同的是它从一个序列的最后一个元素开始算起。上面例子中设定倒数第二个列表元素的字体颜色。</p><p><br/></p><p><br/></p><p>兼容浏览器：IE9+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p><br/></p><p>24. X:nth-of-type(n)</p><p><br/></p><p><br/></p><p>ul:nth-of-type(3) {</p><p>&nbsp; &nbsp; border: 1px solid black;</p><p>}</p><p><br/></p><p>与X:nth-child(n)功能类似，不同的是它匹配的不是某个序列元素，而是元素类型。例如上面的代码设置页面中出现的第三个无序列表ul的边框。</p><p><br/></p><p><br/></p><p>兼容浏览器：IE9+、Firefox、Chrome、Safari</p><p><br/></p><p><br/></p><p>25. X:nth-last-of-type(n)</p><p><br/></p><p>ul:nth-last-of-type(3) {</p><p>&nbsp; &nbsp; border: 1px solid black;</p><p>}</p><p><br/></p><p>与X:nth-of-type(n)功能类似，不同的是它从元素最后一次出现开始算起。上面例子中设定倒数第三个无序列表的边框。</p><p><br/></p><p><br/></p><p>兼容浏览器：IE9+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p><br/></p><p>26. X:first-child</p><p><br/></p><p>:first-child伪类用于匹配一个序列的第一个元素。我们经常用它来实现一个序列的第一个元素或最后一个元素的上（下）边框，如：</p><p><br/></p><p><br/></p><p>ul li:first-child {&nbsp;</p><p>&nbsp; &nbsp; border-top: none;&nbsp;&nbsp;</p><p>}</p><p><br/></p><p>兼容浏览器：IE7+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p><br/></p><p>27. X:last-child</p><p><br/></p><p><br/></p><p>ul &gt; li:last-child {</p><p>&nbsp; &nbsp; border-bottom:none;</p><p>}</p><p><br/></p><p>与:first-child类似，它匹配的是序列中的最后一个元素。</p><p><br/></p><p><br/></p><p>兼容浏览器：IE9+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p><br/></p><p>28. X:only-child</p><p><br/></p><p><br/></p><p>div p:only-child {</p><p>&nbsp; &nbsp; color: red;</p><p>}</p><p><br/></p><p>这个伪类用的比较少。在上面例子中匹配的是div下有且仅有一个的p，也就是说，如果div内有多个p，将不匹配。</p><p><br/></p><p>&nbsp;</p><p>&lt;div&gt;</p><p>&nbsp; &nbsp; &lt;p&gt; My paragraph here. &lt;/p&gt;</p><p>&nbsp; &nbsp; &lt;/div&gt;&lt;div&gt;</p><p>&nbsp; &nbsp; &lt;p&gt; Two paragraphs total. &lt;/p&gt;</p><p>&nbsp; &nbsp; &lt;p&gt; Two paragraphs total. &lt;/p&gt;</p><p>&lt;/div&gt;</p><p><br/></p><p>在上面代码中第一个div中的段落p将会被匹配，而第二个div中的p则不会。</p><p><br/></p><p><br/></p><p>兼容浏览器：IE9+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p><br/></p><p>29. X:only-of-type</p><p><br/></p><p>li:only-of-type {</p><p>&nbsp; &nbsp; font-weight: bold;</p><p>}</p><p><br/></p><p>这个伪类匹配的是，在它上级容器下只有它一个子元素，它没有邻居元素。例如上面代码匹配仅有一个列表项的列表元素。</p><p><br/></p><p><br/></p><p>兼容浏览器：IE9+、Firefox、Chrome、Safari、Opera</p><p><br/></p><p><br/></p><p>30. X:first-of-type</p><p><br/></p><p>:first-of-type伪类与:nth-of-type(1)效果相同，匹配出现的第一个元素。我们来看个例子：</p><p><br/></p><p>&lt;div&gt;</p><p>&nbsp; &lt;p&gt; My paragraph here. &lt;/p&gt;</p><p>&nbsp; &lt;ul&gt;</p><p>&nbsp; &nbsp; &nbsp; &lt;li&gt; List Item 1 &lt;/li&gt;</p><p>&nbsp; &nbsp; &nbsp; &lt;li&gt; List Item 2 &lt;/li&gt;</p><p>&nbsp; &lt;/ul&gt;</p><p>&nbsp; &lt;ul&gt;</p><p>&nbsp; &nbsp; &nbsp; &lt;li&gt; List Item 3 &lt;/li&gt;</p><p>&nbsp; &nbsp; &nbsp; &lt;li&gt; List Item 4 &lt;/li</p><p>&nbsp; &lt;/ul&gt;</p><p>&lt;/div&gt;</p><p><br/></p><p>在上面的html代码中，如果我们希望仅匹配List Item 2列表项该如何做呢：</p><p><br/></p><p><br/></p><p>方案一：</p><p><br/></p><p><br/></p><p>ul:first-of-type &gt; li:nth-child(2) {</p><p>&nbsp; &nbsp; font-weight: bold;</p><p>}</p><p><br/></p><p>方案二：</p><p><br/></p><p>&nbsp;</p><p>p + ul li:last-child {</p><p>&nbsp; &nbsp; font-weight: bold;</p><p>}</p><p><br/></p><p>方案三：</p><p><br/></p><p><br/></p><p>ul:first-of-type li:nth-last-child(1) {</p><p>&nbsp; &nbsp; font-weight: bold;</p><p>}</p><p><br/></p><p>兼容浏览器：IE9+、Firefox、Chrome、Safari、Opera。</p><p><br/></p><p><br/></p><p>总结：</p><p><br/></p><p><br/></p><p>如果你正在使用老版本的浏览器，如IE 6，在使用上面css选择器时一定要注意它是否兼容。不过，这不应成为阻止我们学习使用它的理由。在设计时，你可以参考浏览器兼容性列表，也可以通过脚本手段让老版本的浏览器也支持它们。</p><p><br/></p><p>&nbsp;</p><p><br/></p>', 1, 0, '2018-12-17 17:42:01', '2018-12-19 17:17:57', '', 0, 0, 0),
(2, 0, 3, '无JavaScript实现内容切换效果', 'wkiwi', 'wkiwi', 'html,css,javascript', '选项卡式的内容切换效果，应用的场景比较多，用JavaScript是如何实现的不是我们今天说的重点。如果我们的”选项卡式的内容切换效果”在禁用JavaScript的情况下是否可以正常运行？是否可以满足用户的基本需求？是我们讨论的重点。 不过此情况放在中国的用户群体是不会有禁用JavaScript 的情况。但是我们不能放弃我们追求完美的精神。', '', '1,2,3', '<p><br/></p><p>选项卡式的内容切换效果，应用的场景比较多，用JavaScript是如何实现的不是我们今天说的重点。如果我们的”选项卡式的内容切换效果”在禁用JavaScript的情况下是否可以正常运行？是否可以满足用户的基本需求？是我们讨论的重点。</p><p>不过此情况放在中国的用户群体是不会有禁用JavaScript 的情况。但是我们不能放弃我们追求完美的精神。</p><p><br/></p><p><br/></p><p><br/></p><p>The CSS Code :</p><p><br/></p><p><br/></p><p><br/></p><pre class="brush:css;toolbar:false">/**重置样式**/\r\n*{margin:0;padding:0;}\r\nbody{font:12px/1.5&nbsp;;}\r\nul,&nbsp;ol&nbsp;{list-style:&nbsp;none;&nbsp;}\r\na&nbsp;{text-decoration:&nbsp;none;&nbsp;}\r\na:hover&nbsp;{text-decoration:underline;&nbsp;}\r\nimg&nbsp;{border:0;}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/**内容样式**/\r\n.section{width:350px;&nbsp;margin:0&nbsp;auto;&nbsp;}&nbsp;#content-slider{border:1px&nbsp;solid&nbsp;#666;height:200px;width:350px;&nbsp;margin-top:50px;}\r\n#content-slider-inside{height:200px;overflow:hidden;&nbsp;}\r\n#content-slider-inside&nbsp;li{background-color:#ccc;height:200px;width:350px;text-align:center;font-size:100px;line-height:200px;color:#666;}&nbsp;#navigation&nbsp;{margin:&nbsp;10px&nbsp;0&nbsp;0&nbsp;0;float:&nbsp;right;}\r\n#navigation&nbsp;li&nbsp;{border:solid&nbsp;1px&nbsp;#ccc;&nbsp;float:left;width:20px;height:20px;line-height:20px;text-align:center;margin-left:5px;}\r\n#navigation&nbsp;li&nbsp;a,&nbsp;#navigation&nbsp;li&nbsp;a:link,&nbsp;#navigation&nbsp;li&nbsp;a:visited&nbsp;{color:&nbsp;#666;display:&nbsp;block;height:20px;}\r\n#navigation&nbsp;li&nbsp;a:hover,&nbsp;#navigation&nbsp;li&nbsp;a:focus,&nbsp;#navigation&nbsp;li&nbsp;a:active&nbsp;{background:#666;color:#fff;}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#navigation&nbsp;li.current&nbsp;a,&nbsp;#navigation&nbsp;li.current&nbsp;a:link,&nbsp;#navigation&nbsp;li.current&nbsp;a:visited&nbsp;{background:#666;color:#fff;}</pre><p><br/></p><p><br/></p><p>The HTML Code :</p><p><br/></p><p><br/></p><pre class="brush:html;toolbar:false">&lt;div&nbsp;class=&quot;section&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;div&nbsp;id=&quot;content-slider&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;ul&nbsp;id=&quot;content-slider-inside&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&nbsp;id=&quot;one&quot;&gt;1&lt;/li&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&nbsp;id=&quot;two&quot;&gt;2&lt;/li&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&nbsp;id=&quot;three&quot;&gt;3&lt;/li&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&nbsp;id=&quot;four&quot;&gt;4&lt;/li&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&nbsp;id=&quot;five&quot;&gt;5&lt;/li&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/ul&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;/div&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;ul&nbsp;id=&quot;navigation&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;a&nbsp;href=&quot;#one&quot;&gt;1&lt;/a&gt;&lt;/li&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;a&nbsp;href=&quot;#two&quot;&gt;2&lt;/a&gt;&lt;/li&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;a&nbsp;href=&quot;#three&quot;&gt;3&lt;/a&gt;&lt;/li&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;a&nbsp;href=&quot;#four&quot;&gt;4&lt;/a&gt;&lt;/li&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;a&nbsp;href=&quot;#five&quot;&gt;5&lt;/a&gt;&lt;/li&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;/ul&gt;\r\n&lt;/div&gt;</pre><p>通过”锚点链接”原理我们已经实现了基本的切换效果。要想做更多扩展和完善当然得用JavaScirpt.通过以上源码，我们可以看出我们使用的是”锚点链接”的原理，来实现内容切换的，当我们点击这些链接的时候，会先去页面上寻找诸如的内容（例如：&lt;a&gt;的name属性），如果没有，就会寻找页面上id为此锚点的元素，马上就会定位到匹配锚点的元素的顶部。这样就可以根据”锚点链接”的原理，让容器里面的内容切换显示。</p><p><br/></p><p>The jQuery JavaScript :</p><p><br/></p><p><br/></p><pre class="brush:js;toolbar:false">var&nbsp;MooJS=&nbsp;MooJS&nbsp;||&nbsp;{};&nbsp;\r\nMooJS.tabs&nbsp;=&nbsp;function(container,&nbsp;startIndex)&nbsp;{\r\nvar&nbsp;root&nbsp;=&nbsp;container&nbsp;||&nbsp;&#39;#tabs&#39;;\r\nvar&nbsp;speed&nbsp;=&nbsp;500;&nbsp;\r\nstartIndex&nbsp;=&nbsp;startIndex&nbsp;||&nbsp;0;\r\nroot&nbsp;=&nbsp;$(root);\r\nroot.addClass(&#39;js-enabled&#39;);&nbsp;//add&nbsp;click&nbsp;events\r\n$.each(root.find(&#39;ul&nbsp;li&nbsp;a&#39;),function(index)&nbsp;{\r\nvar&nbsp;that&nbsp;=&nbsp;$(this);\r\nif(index&nbsp;==&nbsp;startIndex)&nbsp;{\r\nthat.parent().addClass(&#39;current&#39;);\r\n}\r\nthat.click(function(){\r\n//set&nbsp;current&nbsp;class\r\n$(this).parent().addClass(&#39;current&#39;);\r\n$.each($(this).parent().siblings(),function()&nbsp;{\r\n$(this).removeClass(&#39;current&#39;);\r\n});\r\n//show/hide&nbsp;panels\r\n$.each($(that.attr(&#39;href&#39;)).fadeIn(speed).siblings(),function(){\r\n$(this).hide();\r\n});\r\nreturn&nbsp;false;\r\n});\r\n});&nbsp;//hide&nbsp;all&nbsp;but&nbsp;start&nbsp;index\r\n$.each(root.find(&#39;#content-slider-inside&nbsp;&gt;&nbsp;*&#39;),function(index,&nbsp;el)&nbsp;{\r\nif(index&nbsp;!=&nbsp;startIndex)&nbsp;{\r\n$(this).hide();\r\n}&nbsp;\r\n});};&nbsp;\r\n$(document).ready(function(){\r\nvar&nbsp;tabs&nbsp;=&nbsp;$(&#39;#demo&#39;);\r\nif(tabs.length){\r\nMooJS.tabs(tabs);\r\n}});</pre><p><br/></p>', 1, 0, '2018-12-17 18:01:36', '2018-12-19 17:30:06', '', 0, 0, 0),
(3, 0, 3, '关于面试和跳槽', 'wkiwi', 'wkiwi', '前端开发,工作总结', '梦想不止于前端！', '', '1,2,3', '<h2>关于面试和跳槽</h2><p>IT跳槽是一种常态，也是众所周知的。就目前主了解主要有几点原因：</p><ul class=" list-paddingleft-2"><li><p>工作变的枯燥，没有激情，没有成就，干的没意思。</p></li><li><p>能力提升和工资不成正比，每天都在变强，但是工资不见涨。</p></li><li><p>公司项目不符合心意，老是后台管理，腻不腻啊。</p></li><li><p>公司技术老套，一套玩到死，模版都不带改的。</p></li><li><p>加班严重，受不了了，不是人过的。</p></li><li><p>其它原因...（想写全栈，回老家）</p></li></ul><p>跳槽，对绝大数新人是非常必要的。因为一般公司，所需要的可能并不是一个高薪码农，这份工作，我招一个实习生也能做，为啥要花大钱养个老油条。一年前的你适合这个公司，不代表一年后你还是和继续留下。跳槽学问很大，也是一个要好好学习的点。简历的star法则，骑驴找马啥的，不知道的同学可得网上多找些文章看看了。</p><p>找工作，6分技术 ，2分运气，剩下2分靠包装。简短的面试肯定挖掘不出你的全部。关注机会，把握机会，养兵千日，用兵一时，面试的时候就是我们用兵的时候了。</p><h2>后记</h2><p style="text-align: center; margin-top: 10px;"><strong>工作是为了活着，<br/>撸码是为了享受。</strong></p><p style="text-align: center; margin-top: 10px;"><strong>努力工作是为了更好的活着，<br/>努力撸码是为了更好的享受。</strong></p><p style="text-align: center; margin-top: 10px;"><strong>横批：不忘初心</strong></p><p><br/></p>', 1, 0, '2018-12-18 14:27:08', '2019-07-04 10:13:28', '', 0, 0, 0),
(4, 0, 3, '程序员，你真的会写简历吗？', 'wkiwi', 'wkiwi', '程序员,简历,前端,javascript,html,css,vue', '又是一年跳槽季，金三银四毫不夸张。 简历是我们找工作的行头，重要性不言而喻。可你真的会写简历吗？  面试其实就是面试官和你的一次约会。他是女你是男，能不能在一起取决于你能否讨他的欢心。一份整洁的简历，重要性不亚于你约会时的行头和装束。', '', '1,2,3', '<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">又是一年跳槽季，金三银四毫不夸张。 简历是我们找工作的行头，重要性不言而喻。可你真的会写简历吗？</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">面试其实就是面试官和你的一次约会。他是女你是男，能不能在一起取决于你能否讨他的欢心。一份整洁的简历，重要性不亚于你约会时的行头和装束。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">感谢这个时代简历不再需要手写，不然很多人的“字”都过不了关，比如说我，现在几乎是不会写字的。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">简历是一个行业性和时代性很强的东西，不同的时代和行业简历的最优形态都不同，但一份好的简历总会有一些共同的特质。当然，简历只是“形”，真正重要的还是你个人的综合素质、业务能力以及技术水平。如果个人不具备很强的竞争力，那么简历就成了各大直播平台网红主播的封面照，只能在列表里看看，是万万不能点进去的。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">我不能说什么样的简历好，什么样的简历不好，每个简历审阅者都有自己的偏好。但我尝试从这些年看技术简历的经验中提取出一些我所关注的点，尝试和大家聊聊一份简历应该有的结构、细节、风格，以及一定不要有的内容。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">简历这东西，说白了，就是你认真，他/她也认真。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">整体风格</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">首先，简历的第一要素是它必须要，简洁而不简单。这是整体风格。我们来看看整体风格上要注意哪些。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">我看过很多同学的简历只有一页，字大行稀，这不好，3秒看完，还不知道你到底会干撒，这样的简历HR筛选简历这一关都过不了，根本到不了技术面试官手里；也看过很多简历，一页里密密麻麻的宋体4号字，这也不好，看的太累（但绝对比字大行稀要好）。通常来说选用宋体5号字，正文行间距在1.2左右。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">正文不要有任何的加粗，只加粗标题（目的是为了让结构清晰）。各种在正文里加粗的作法会让面试者觉得太做作，自信的人是不需要特意强调某个关键字的，你的整体风格看起来清爽简介，简历筛选者自然会认真对待，并自己去寻找她需要的信息，根本无需加粗。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">简历的页数很多文章推荐1到2页不超过3页，这说了和没说一样。我推荐的简历页数是2页，1页太少，3页太多，2页最佳。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">不要做彩色的简历（设计师除外）。只有黑白两色即可。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">对于研发岗位，不要附加照片，不要附加照片，不要附加照片，长的美不美、帅不帅都没有太多的好处。你根本不知道看简历的会不会嫉妒你的美貌。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">简历的格式最好是PDF、PDF、PDF，重要的事情说3遍。很多人喜欢发Word，不是不行，但绝对没有一份PDF的看的舒服。一是PDF是只读模式，二是PDF打开更快速。Word这种东西，打开全屏的错别字检查，这体验简直是不能忍。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">简历的文件命名请采用以下格式 姓名-电话-职位.pdf。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">不要在简历中写自己的微信号、QQ号。联系方式只留下一个邮箱和手机号即可。邮箱最好是163，outlook或者gmail，随意。qq邮箱这个怎么说吧，我个人认为是无所谓的，但遇到有些面试官就不好说了。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">内容</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">一份简历的结构非常的重要，基本上如果我至上到下扫一遍觉得结构非常混乱，不能让我对你有一个初步的了解，是不会继续往下看的，直接打回到HR那里。大家要知道每个人的时间都很宝贵，看简历的人没有义务为你的不认真买单。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">好的简历结构遵循以下的层次结构（并不是唯一结构，只是我推荐的一种）：</p><ol style="list-style-type: none;" class=" list-paddingleft-2"><li><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px;">标题。标题只需要写XX的个人简历即可。</p></li><li><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px;">个人简介。个人简介包括姓名、毕业学校（大学以上）、年龄、出生年份（别写月日，看简历的不会想在你生日的时候给你一份惊喜）、学历、目前职位、籍贯、联系方式。要注意，这些内容通常都非常简单，不要每个属性单独一行，一行排3个属性最好。</p></li><li><p>工作经历。这是我很多同学完全忽略的地方，完全没有分清楚工作经历和项目经历。工作经历必须单独成为一块儿，每段经历不需要些太多，只需要以年份+公司名称+职位即可。比如</p></li></ol><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">2001~2003 xxx公司，PHP程序员</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">2003~2005 xxx公司，架构师</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">2005~2012 xxx公司，技术总监</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">2012~2016 xxx公司，CTO</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">就是这么简单即可，具体的工作内容是在项目经验里描述的。我推荐的就是这些内容，如果你还要加上薪资多少、公司规模等附加内容，我并不推荐，因为这些内容都是可以虚构的，写上去没有任何好处，反而会给简历阅读者一种无法掌控的心里暗示，他根本无法去核对这些信息。所以简历一定要尽可能的写一些容易实在的内容。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">注意，时间一定要按照顺序排列，不要倒叙排列。这里是为了让简历阅读者看到你的履历，没有必要倒叙排列。时间最好能够接上，如果时间有中断，比如中间自己出去瞎折腾创业去了，想好怎么回答面试者的提问。80%的概念，提问者会问你中间这段时间干嘛去了。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">4 .&nbsp;相关技能。&nbsp;不要简单的罗列技术名词（这点太太太重要了），有些同学面试PHP岗位，技术名词从服务器到前端、从数据库到缓存、从PHP到Java，几乎我知道的技术名字他都写上去了。我一看工作年限，才不到3年。这样的简历，直接是被Pass的，对于一个正常智商水平的人来说，3年是不可能精通或者了解这么多技术和语言的。换句话说，如果你天赋异禀，我觉得你是不会投简历到我们这家小公司的，你早就是BAT、MS、Google的抢手货了。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">推荐技术以Tech Stack技术栈的形式出现，形成一个系统，而不要东一个西一个，前端就是前端、服务器就是服务器，清清楚楚明明白白，即使你认为你是一个FullStack开发者，也请偏重一端，而不是两端齐头并进。你认为的Full Stack在很多有资历的技术开发者面前也许只是玩具，自娱自乐可以，但并不能应用到真实的生产环境中（真实环境有非常多的细节，一个非专业的开发者很难兼顾到所有细节）。所以，如果你要以 Full Stack的姿态出现在面试官面前，请三思。毕竟像模像样的公司，前端和服务器是区分非常严格的，专人专事儿才能做好一个产品。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">所以，请慎重填写技术名词，最好每个技术名词附加一个更加详细的使用点。比如你说你懂Redis，那么请这样写：熟悉Redis的常规操作，对Redis五种数据类型、pub\\sub模式有较深入的理解，并将Redis应用在系统的缓存层以及秒杀系统中（如果你这样写，多半面试官会问你关于秒杀的细节，你就可以提前准备这方面的知识了）；</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">这样写远比你把同类缓存系统全部罗列一边要好很多很多。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">还要提醒大家，同类技术最好只写一个，很少有人能精通两个以上。比如对于Vue、Ng、React，我推荐事实求是。只选1个来写，精通AngularJS（然后按照上诉举例的Redis，写出其特性，比如AngularJS的指令、双向数据绑定等）。其实只写精通AngularJS即可，没有必要再补充一句“熟悉Vue”。简历阅读者要的是精通而非“泛”。而且，相信我，一个资深的技术总监，都相信一个真理，你精通一个框架再熟悉其他的框架并不是一个难事儿。你完全不需要担心我只会Vue，但公司要的是NG怎么办？这是没办法的办法，那么多框架，你能学得完？比如TP和Laravel，你精通一个另外一个真的不是什么太大的问题，但前提条件是，你！要！精！通！</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">精通有点儿夸张，这个词在简历里已经被用烂了。事实上，严格意义上来讲，我们都只是能够很熟练的使用某个框架，要说到精通，个人认为等你把框架源代码看完了再来谈“精通”。所以，我认为是不是用精通这个词来描述技术，这取决于“精通”在你简历里出现的频度。如果你总共6项技能，4到5项都是精通、精通、精通、精通、精通，这很容易让你在面试的过程中相当的尴尬。合理分配精通、熟悉、了解这3个等级词汇的出现频度是非常重要的。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">另外一个建议是，对于你不熟悉的只是知道是干什么的技术，千万不要写。很多面试者很喜欢找你只是简单提了一下的技术来发问，当然他并没有指望你能回答的多么准确，可如果哥们你一脸懵逼，完全不知道他说的是什么，应付几句的话都说不出来，那真的是得不偿失。如果你万一被问的懵逼了，请直接了当的说抱歉，这个我了解的并不深入，切忌东拉西扯，欲盖弥彰。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">对于前端同学来说，不要过多的描述CSS和HTML相关的能力。在很多公司眼里CSS和HTML是属于非常基础的能力，重要的是什么，重要的是JavaScript。如果你用JavaScript写过或者开发过任何框架性的东西，这是相当加分的。很多同学对于前端的理解还停留在“前端就是做页面”这个阶段，但事实上前端已经和服务器没有差别，大量复杂的业务需要前端来处理。这也是为什么这些年前端框架这么流行的原因，早期的网页哪儿有框架这个说法，一个Jquery走天下，更早的时候还有extjs这些，注意jquery只是一个库或者说工具，并不是框架。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">总结来说，CSS和HTML提一下即可，可以描述自己能够熟练使用LESS或者SASS。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">还有一个坑，如果你不是专业的DBA，切忌不要写精通MySQL，你根本不知道MySQL或者其他数据库精通是一个什么概念，随便问你几个数据库的锁机制你都答不上来，更何况很多同学连事务都没有使用过，只是简单的查询数据并不能说“精通MySQL”。当然，如果你应聘的是Web开发者，面试官也根本不会对你的MySQL要求有多高，会使用事务、能够很好的建立索引，避免过多的使用join查询，不会愚蠢的循环查询数据库即可。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">很多前端开发者喜欢附上自己个人作品，这个个人作品通常就是自己搭建的一个个人主页或者是博客，动效非常华丽，页面UI上佳，但相信我，HR筛选者看的都已经审美疲劳了。如果你的个人博客里没有什么有深度的技术文章，我并不建议附带这种纯粹的页面网页。原因还是在于我说的，你既然附上了作品，那么你肯定认为这是你最好的或者是最满意的。但你最好的最满意的作品，只是一个简单的效果网页，这会给面试官一种你根本不理解现在的前端是要做什么的感觉，他会潜意识的认为，你还停留在前端就是做网页这个阶段。得不偿失。当然，如果你有些博客的习惯，并且认真的对待每一篇的文章，那么无聊文章水平高低，都建议附加上。还有，不要附带自己的微信公众号在简历里，你是求职研发的，不是来做媒体的，这和技术不搭边。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">5. 项目经历、经验</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">切忌多而杂，很多同学，4,5页简历十几个项目，不管大项目、小项目统统都罗列出来，这非常的不好。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">你需要挑选有代表性的项目，每个公司1到2个项目为佳。项目经验、描述把握一个原则，求质不求量。深度描述你在每个项目里的职责。推荐大家重点描述项目遇到了什么问题，你是如何解决的，或者是从业务、设计上巧妙规避或者是用什么技术来解决这个问题的。比如使用任务队列异步解耦订单的处理；使用Redis的pub\\sub来做定时器，避免长连接轮询；前端使用事件注册机制传递参数避免类与类之间的耦合等。一个项目里技术点太多了，选择你认为最重要或者你最得意的技术点来描述项目是非常好的做法。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">不要在项目里机械的写出自己的职位，很多同学罗列十几个项目，每个项目都机械的写上项目经理、产品经理、程序员、小组长、负责人。没有必要。现在的公司都喜欢说自己是扁平化管理, 不建议强调自己在每个项目中的职位。你只需要写出你在项目中做了什么事情，解决了什么问题，深度描述你所使用的技术即可。其他的奇淫技巧根本不需要。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">简历包括以上内容即可，如果你还有其他的比较有名气的开源项目可以附加上。我并不推荐杂七杂八的写一些个人的小作品，如果你在github上有一些高Star的开源项目，可以写上去，绝对是加分项。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">最后，还是要提醒各位马上要换工作的同学，你的技术水平如何，一个稍微有资历的技术面试官问几个问题马上就能知道你的技术水平如何。所以，努力提升自己才是最重要的，如果你的技术功底深厚，不需要太多技巧简历也不会太差，但本文所提出的注意点并不属于技巧，而是一份优秀简历的基本要素。</p><p><br/></p><p><br/></p>', 1, 0, '2018-12-28 16:43:20', '2018-12-28 16:43:20', '', 0, 0, 0);
INSERT INTO `article` (`id`, `classify`, `user_id`, `title`, `author`, `copyright`, `keywords`, `description`, `thumbnail`, `recommend`, `content`, `type`, `read_type`, `create_time`, `update_time`, `article_extend`, `hits`, `comment`, `praise`) VALUES
(5, 0, 3, '给编程初学者的一些建议', 'wkiwi', 'wkiwi', '前端,编程,初学者', '兴趣不是编程最大的动力，成就感才是!', '', '1,2,3', '<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">知名博主和菜头有一个常用的签名：请你相信我所说的每一句话都是错的。如果你理性的分析这句话，你会发现这句话其实是一个很有意思的悖论，用来证明无论正反、相信或者不相信，他永远都是对的。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">但只可惜，没有什么是绝对的正确，编程的经验与教条也同样没有永恒的正确。所谓经验，都是他人的感悟；所谓教条也都是他人的痕迹；你应当去实践，去思考，形成自己独有的编程体验。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">所以，下面的观点，均是个人体验形成；虽不“成器”，但好在是“自己的”。</p><p><span style="color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; background-color: rgb(248, 250, 252); display: block; font-size: 22px; margin: 22px 0px 10px;">1 兴趣不是编程最大的动力，成就感才是</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">不骗人，我对编程谈不上兴趣。对编程有没有兴趣也不是一个人能否写好程序的必备条件。兴趣必然是一种不求回报能让自我陶醉甚至是沉迷其中的持续性行为。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">”兴趣“太过于美丽，我觉得我远没有达到这种高度。”成就感“这个词也许会更贴切一些。事实上，我们绝大多数人编程其实只是为了混口饭吃或者让自己生活的更好一些。但不得不承认，长期从事一种近似枯燥的“劳作”没有一些信念与寄托是不行的。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">排除掉编程是为了生存这个残酷的现实，还能支撑我持续编程的我认为是成就感。这和打游戏给我带来的感觉其实是没有区别的。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">当我一次次的击倒关底的boss，当我角色的等级不断的提升，当我通过自己的努力打出超越常人水平的DPS，当我流畅的按出QWER 5杀后，这种满满的成就感是不可替代的。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">编程也是一样。记忆中，我曾经无数次揉着睡眼惺忪双眼，一边看着窗外微微发白的夜色，一边偷瞄几眼连夜赶出、正在流程运行的程序，心中暗自得意。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">这种感觉妙不可言。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">准确的在编程中找到这种”成就感“，甩开”兴趣“或者”爱好“的包袱，对于一个程序员来说极其重要。为生存编程也好，为艺术编程也好，为理想编程也好，总之，你一定要找到一个可以驱动你长期编程的动力。</p><p><span style="color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; background-color: rgb(248, 250, 252); display: block; font-size: 22px; margin: 22px 0px 10px;">2 debug是倚天剑，提出优质问题是屠龙刀</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">debug与提问是编程过程中两个截然相反的方向。debug代表着自我解决问题，而提问代表着寻求帮助。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">如果有可能，我们应当尽量的通过debug来解决问题，而不是通过提问来解决问题。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">我才工作时，当我的代码出现了错误，我也曾天真烂漫的向我的同事寻求帮助。结果只有两个：要不就是别人来帮我debug调试错误，要不就是不怎么搭理我。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">渐渐的，我意识到，不怎么搭理我是因为我提的问题根本就不是问题，直接把答案放到搜索引擎上搜一下大把大把的答案就疯狂的涌现出来；别人帮我debug，这实在是自己懒惰的借口。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">从此我基本上不再向他人寻求帮助，因为，我不是在造火箭大炮，我也不是在做前无古人后无来者的工作，对于一个才工作的程序员，我必定是在重复了其他程序员已经重复了无数次的工作，这些必然是可以通过搜索引擎+自己debug就能寻找到答案的。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">工作5年后，我才真正意识到自己debug分析问题是多么的重要。初级编程思维的形成不是来源于写代码的过程，而是来自于自己调试代码的过程。所以，每一次把希望寄托在他人身上来解决问题，其实都是浪费了一次培养自己编程思维的机会。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">那我们可不可以向他人来提问或者寻求帮助呢？可以，但是如果自己一点都不思考就匆忙的发出提问，这绝对不是一个好的做法。如果要提问，尽量保证提问的是优质的问题。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">debug毫无疑问是倚天剑，但只有“优质”的问题才是另一把屠龙宝刀。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">什么是优质的问题？每个程序员功底不同，很难有个准确的定义。但我认为优质问题的前提是，问题必须已经经过你充分的思考，至少要保证你提出的问题思路是清晰的，而不是需要他人debug来帮你解决的问题。我们很难保证一个问题绝对的优质，但如果你能够自己先深入思考，那么至少你可以保证整个问题对于你自己来说是足够“优质”的。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">我再提问区里看到的最多的问题就是“为什么出现undefined”，为什么出现“None”，为什么报404，为什么报500错误。这显然都没有触及到问题的本质，这些都是可以通过debug来找到原因的。而这些问题恰恰是老师最难以去解决的。因为老师也需要依赖“debug”。不仅仅是老师要debug，全人类程序员都要debug来解决问题。除非你是ET拥有人类不具备的超能力。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">所以，遇到问题，首先debug，最好是断点调试，坚信debug的力量。一般来说通过debug都能触及到问题的本质，这些本质的问题可能就超出了你目前知识的范畴，这个时候再提问，就能够提出一个较为优质的问题。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">好的问题是由问问题的人和回答问题的人共同构建的，我们大多数时候只会想到好的问题是由答者单方面构建的，这显示是不正确的。不要小瞧问问题，它其实也是一个人能力的体现。</p><p><span style="color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; background-color: rgb(248, 250, 252); display: block; font-size: 22px; margin: 22px 0px 10px;">3 努力写出优质的代码，而不是仅仅满足于功能的实现</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">编程到底是不是艺术，我们不做过多的探讨。艺术也好情怀也好，都是若有似无的东西。我绝对不会拿编程是艺术来说服你为什么要努力写出优质的代码。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">我在管理研发团队的过程中发现二个很有意思的现象，第一个就是前面我谈到的：鲜有真正视编程为“兴趣”的coder。第二个就是，编程2到3年时，大部分的初级程序员不仅不会把编程当做兴趣，反而会认为编程很“无聊”。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">通过与这些coder的聊天和查看他们的代码，我发现，这些coder普遍都只是完成了程序的功能，从来不考虑复用，不考虑维护，不考虑扩展。就像一次性的筷子，用完就扔。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">可软件开发不能像吃饭一样，吃完就把筷子丢了。软件开发必然是一个反复迭代、修正、调整的工程，甚至调整和维护的人并不是你自己。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">一次性筷子你用完后自己都不想再捡回来用第二次吧，那怎么可能别人还愿意捡回来继续用呢？</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">咱们很多coder写代码太直白了，标准的“直男型”代码。一个Controller中写100多行代码的人大有人在。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">对于普通的编程工作，尤其是Web开发，只完成功能不考虑性能、代码结构，实在是太过于简单。你只需要掌握一门语言里最基础的流程控制和基本语法就能实现各种各样的功能，连稍微高级一些的语法都完全不需要。如果一件事情太简单，没有任何挑战，那必然会觉得无聊。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">追求优质代码的写法，是可以让你长久保持编程动力的一个法宝。每个人其实内心都多多少少对“美”有一种期待，长期看到乱糟糟的代码，很容易让你对编程厌倦。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">此外，代码风格其实分两类：一类是具体的代码，另外一类是抽象的代码。人类最直观的思维方式是从具体开始，所以写出具体的代码是很容易的，但要写出抽象的代码其实是不太容易的。这就好像你通过简单的绘画学习就可以画出一些还不错的风景，但你要成为梵高，这还是有点难度的，对吧。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">如果要培养这种抽象代码的编写能力，起步条件就是追求优质的代码，如果连起步条件都不具备，那代码编写的能力必然逐步趋于平庸。放弃对于优质代码的追求，其实等同于放弃了编程思考的乐趣，没有了思考，代码哪儿还有你自己的风格和灵魂？</p><p><span style="color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; background-color: rgb(248, 250, 252); display: block; font-size: 22px; margin: 22px 0px 10px;">4 视频课程学习最好的方式是自己先实现</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">很早就想谈谈如何有效的通过视频进行学习。方法太多了，而且根据每个人的学习习惯又可以演化成各种侧重点不同的学习方法。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">但收益最大一种方式是：对于有一定基础的同学，先不要看课程，直接先看老师项目成品，自己完全独立的1：1的完成整个项目。全部完成后，再细看老师的课程。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">没有对比就没有伤害，也许对比后“伤害”的是你，也有可能“伤害”的是老师。但无论“伤害”的是哪一方，收益的终将是你。假如你被“伤害”了，那你必然是深刻理解了为什么老师的方案比你要更加优秀；如果老师被“伤害”了，那么，还用说吗，你可以去当老师了。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">我们平铺直叙像看小说一样看完整个课程不能说没有收获，但相对于这种对比式的学习，“旅游”式的学习实在谈不上对视频课程“物尽其用”，挺遗憾的吧。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">我当然知道很难有同学有足够的耐心先静心自己实现一遍整个项目。但是，这个行业就是这样，你必须衡量一下你与你同行业者的优劣势。如果你没有良好的外部资源，比如优质的项目、精英的团队，那么你只能从自己身上下功夫，去做一些自己惰性所不不愿意做的事情，只有这样才能弥补自身资源的不足。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">如果实在无法完整的实现整个项目，那么其实可以阶段性的自我实现和思考。我的课程通常小节的划分都是比较讲究的，大多数小节是留有“悬念”的，整个悬念就是给你思考的节点。我很多时候会在小节的末尾提出问题，这个时候你就不应该急着去看下个小节的答案。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">也许这样是不是更容易实现一些呢？</p><p><span style="color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; background-color: rgb(248, 250, 252); display: block; font-size: 22px; margin: 22px 0px 10px;">5 真正的去实践，而不是一味的学习</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">老生常谈的一个问题。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">编程不是考试，还按照初高中备考的思路去学习编程这是不现实的。编程是一个实践性非常强的工种，很多知识和语法你知道并不代表你掌握了。编程考究的是你是否能够灵活的应用这些编程知识。很多时候，你只需要在你脑海中留下一个浅浅的印象，当需要解决问题的时候，迅速能够调出这些知识片段，把他们“组合”在一起来解决问题。细节不记得，不要紧，语言的速查手册就是帮你具体化这些知识的。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">很多编程基础知识就如同阿拉伯数字一样，你只看他他就是数字，但你可曾想过数字也能演化出正数、负数、小数、实数、虚数、指数、复数？</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">这些变化只有在实践中，只有在你真正去解决问题的过程中，你才能体会到变化的奥妙与组合的奇妙。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">很多同学经常会抱怨我不在大公司，我没有优质的项目机会，可你要知道80%的coder都在中小公司，绝大多数coder都没有接触优质项目的机会。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">那难道我们就放弃实践？</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">人之所以为人，就在于我们有很强的主观能动性。外界条件不够优越，我们就自己寻找。模仿你会吗？找一个自己很欣赏的产品，1：1或者尽可能在细节上复制一个产品作为自己的练习项目，有什么不可以吗？连设计师的UI设计都给你省了。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">但这个过程中，大家一定要注意细节，如果你只是实现了大体的功能，这意义不大。好的产品其实就优秀在细节上，好的程序员和普通的程序员一定的差距也在细节上。</p><p><span style="color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; background-color: rgb(248, 250, 252); display: block; font-size: 22px; margin: 22px 0px 10px;">6 学习一定要注重推导的过程，而不是关注结果</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">我常在我的课程中谈到这个问题。熟悉我课程的同学应该都知道，我很少去讲API的调用，更多的是关注编程思想。编程思想具体到课程中其实就是推导的过程。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">工作中我们要更关注成果，但学习一定要注重过程。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">比如在《Python Flask RESTFul API》中，我几乎二次开发了Flask框架。如果你只是拿到了一份很好用的Flask API框架那我觉得意义不大。关键在于我是怎么一步步的推导、分析和落实这个优质框架的。比如为了解决Python序列化模型很麻烦的问题，我是怎么想到去寻找JSONEncoder这个对象的，又是如何来重写他的；而当我们想进一步优化代码时，居然发现Sqlalchemy的模型对象在被动态创建时是不会调用构造函数的，这个时候你需要注意我是如何去sqlalchemy文档中去找到一个可以出发构造的装饰器的；再比如，我们采用JWT令牌，那在Flask中我应该如何来支持Token令牌。这所有的实现，我都不仅仅是直接给出大家一个好的结果，而是详细的描述了我思维的过程。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">语言和框架是学不完的，你只有认真的去跟着我一起思考，才能摆脱受限于语言和框架的思维。很多时候，我课里所讲的内容和思路你放到任何一个语言或者框架里都是通用的。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(248, 250, 252);">结束语：近两年来，我看到太多努力学习的同学，很多同学在本科一年级就开始勤奋的编程和学习。这让我回想起我的大学生活，只有两个字“惭愧”。分享一些我的心得，希望能够帮助到大家。</p><p><br/></p><p><br/></p>', 1, 0, '2018-12-28 16:49:15', '2018-12-28 16:49:15', '', 0, 0, 0),
(6, 0, 3, 'mac百度云不限速下载', 'wkiwi', 'wkiwi', '百度云,不限速,百度云破解版', '百度云下载不限速', '', '1,2,3', '<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);">在windows环境下有很多的百度不限速下载客户端，但是mac环境下就少之又少了，但是又想不限速下载文件，那就要看看推荐的这种方案了，它是网页客户端，并不需要登陆百度云账号，减去了百度云被封号的风险，这就是pandown，这是pandown推出的网页客户端，只需要进入网页，输入资源链接与密码就可以选择不同线路下载，下载速度那是杠杠的：</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);"><br/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);"><br/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);">传送门：<a target="_blank" href="https://www.baiduwp.com/" style="text-decoration-line: none; color: rgb(1, 170, 237);">https://www.baiduwp.com/</a></p><p><br/></p>', 1, 0, '2019-07-04 10:11:33', '2019-07-04 10:11:33', '', 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `banner`
--

CREATE TABLE IF NOT EXISTS `banner` (
  `id` int(10) unsigned NOT NULL COMMENT '主键',
  `title` char(255) NOT NULL DEFAULT '' COMMENT '导航名称',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `pic` char(255) NOT NULL DEFAULT '' COMMENT '轮播图片地址',
  `link` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='轮播图组';

--
-- 转存表中的数据 `banner`
--

INSERT INTO `banner` (`id`, `title`, `sort`, `pic`, `link`, `type`) VALUES
(3, '梦想不止是前端', 2, 'upload/1545299806090.jpg', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `classify`
--

CREATE TABLE IF NOT EXISTS `classify` (
  `id` int(10) unsigned NOT NULL COMMENT '主键',
  `title` char(255) NOT NULL DEFAULT '' COMMENT '分类名称',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `keywords` char(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `classify` int(10) NOT NULL DEFAULT '0' COMMENT '上级分类',
  `description` char(255) NOT NULL DEFAULT '' COMMENT '分类描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='内容分类';

--
-- 转存表中的数据 `classify`
--

INSERT INTO `classify` (`id`, `title`, `sort`, `keywords`, `classify`, `description`, `type`) VALUES
(1, '前端', 0, '前端', 0, '前端', 1),
(2, '后端', 0, '后端', 0, '后端', 1),
(3, 'pc', 0, 'pc', 1, 'pc', 1),
(4, '移动应用', 0, '移动应用', 1, '移动应用', 1);

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(10) unsigned NOT NULL COMMENT '主键',
  `article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章ID',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '评论内容',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论用户ID',
  `create_time` char(30) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '评论时间'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='评论列表';

--
-- 转存表中的数据 `comment`
--

INSERT INTO `comment` (`id`, `article_id`, `content`, `user_id`, `create_time`) VALUES
(1, 1, '梦想不止是前端！！！！！！！！！', 3, '2018-12-20 18:04:41'),
(2, 1, '梦想不止是前端！！！！！！！！！', 3, '2018-12-20 18:04:41'),
(3, 1, '梦想不止是前端！！！！！！！！！', 3, '2018-12-20 18:04:41');

-- --------------------------------------------------------

--
-- 表的结构 `link`
--

CREATE TABLE IF NOT EXISTS `link` (
  `id` int(10) unsigned NOT NULL COMMENT '主键',
  `title` char(255) NOT NULL DEFAULT '' COMMENT '链接名称',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `pic` char(255) NOT NULL DEFAULT '' COMMENT '链接LOGO',
  `link` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='友情链接';

--
-- 转存表中的数据 `link`
--

INSERT INTO `link` (`id`, `title`, `sort`, `pic`, `link`, `type`) VALUES
(1, '独家折扣', 0, '', 'http://djzk.kiwifruits.cn', 1),
(2, 'wkiwi的博客', 0, '', 'https://blog.bemcss.com', 1),
(3, 'wkiwi的博客', 0, '', 'https://blog.bemcss.com', 1),
(4, 'wkiwi的博客', 0, '', 'https://blog.bemcss.com', 1),
(5, 'wkiwi的博客', 0, '', 'https://blog.bemcss.com', 1);

-- --------------------------------------------------------

--
-- 表的结构 `nav`
--

CREATE TABLE IF NOT EXISTS `nav` (
  `id` int(10) unsigned NOT NULL COMMENT '主键',
  `title` char(255) NOT NULL DEFAULT '' COMMENT '导航名称',
  `link` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `keywords` char(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态',
  `classify` int(10) NOT NULL DEFAULT '0' COMMENT '所属分类'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='导航栏信息';

--
-- 转存表中的数据 `nav`
--

INSERT INTO `nav` (`id`, `title`, `link`, `sort`, `keywords`, `type`, `classify`) VALUES
(1, '首页', '', 0, 'html,css,js,koa,node', 1, 0),
(2, '前端开发', '', 0, '前端开发', 1, 0),
(3, 'pc开发', '', 0, 'pc开发', 1, 2),
(4, '移动开发', '', 0, '移动开发', 1, 2),
(5, '后端开发', '', 0, '后端开发', 1, 0),
(6, 'Java开发', '', 0, 'Java开发', 1, 5),
(7, 'PHP开发', '', 0, 'PHP开发', 1, 5),
(8, 'node开发', '', 0, 'node开发', 1, 5);

-- --------------------------------------------------------

--
-- 表的结构 `praise`
--

CREATE TABLE IF NOT EXISTS `praise` (
  `id` int(10) unsigned NOT NULL COMMENT '主键',
  `article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞用户ID',
  `create_time` char(30) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '点赞时间'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='文章点赞列表';

--
-- 转存表中的数据 `praise`
--

INSERT INTO `praise` (`id`, `article_id`, `user_id`, `create_time`) VALUES
(1, 1, 3, '2018-12-20 18:03:35'),
(2, 4, 3, '2018-12-28 16:43:47'),
(5, 5, 3, '2019-03-13 14:52:10'),
(6, 3, 3, '2019-05-08 18:01:35');

-- --------------------------------------------------------

--
-- 表的结构 `recommend`
--

CREATE TABLE IF NOT EXISTS `recommend` (
  `id` int(10) unsigned NOT NULL COMMENT '主键',
  `article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `sort_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章推荐类型 1:精品;2:热品;3:新品'
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='文章推荐类型关联表';

--
-- 转存表中的数据 `recommend`
--

INSERT INTO `recommend` (`id`, `article_id`, `sort_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 1),
(5, 1, 2),
(6, 1, 3),
(7, 2, 1),
(8, 2, 2),
(9, 2, 3),
(10, 3, 1),
(11, 3, 2),
(12, 3, 3),
(13, 4, 1),
(14, 4, 2),
(15, 4, 3),
(16, 5, 1),
(17, 5, 2),
(18, 5, 3),
(19, 6, 1),
(20, 6, 2),
(21, 6, 3);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL COMMENT '主键',
  `user_name` char(50) NOT NULL DEFAULT '' COMMENT '用户帐号',
  `pass_word` char(128) NOT NULL DEFAULT '' COMMENT '用户密码',
  `user_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户类型 0:未审核用户;1:超级管理员;2:普通管理员;3:VIP用户;4:普通用户',
  `user_email` char(128) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `create_time` char(30) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '注册时间',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `update_time` char(30) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后登录时间',
  `user_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `user_extend` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '扩展信息'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户据库表';

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `user_name`, `pass_word`, `user_type`, `user_email`, `create_time`, `login_ip`, `update_time`, `user_pic`, `user_extend`) VALUES
(1, 'wkiwi', 'd6b6a389080b35c669cb46_123131', 1, 'w_kiwi@163.com', '2018-12-17 14:39:20', '127.0.0.1', '2020-03-07 15:33:37', 'default/images/avator.jpg', '前端开发，移动应用，小程序开发');

-- --------------------------------------------------------

--
-- 表的结构 `website`
--

CREATE TABLE IF NOT EXISTS `website` (
  `id` int(10) unsigned NOT NULL COMMENT '主键',
  `title` char(255) NOT NULL DEFAULT '' COMMENT '网站标题',
  `logo` char(255) NOT NULL DEFAULT '' COMMENT '网站logo',
  `keywords` char(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `content` char(255) NOT NULL DEFAULT '' COMMENT '网站描述',
  `record` char(255) NOT NULL DEFAULT '' COMMENT '网站备案号',
  `copyright` char(255) NOT NULL DEFAULT '' COMMENT '版权'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='网站信息';

--
-- 转存表中的数据 `website`
--

INSERT INTO `website` (`id`, `title`, `logo`, `keywords`, `content`, `record`, `copyright`) VALUES
(1, 'wkiwi的博客', '', 'html,css,js,koa,node', 'html,css,js,koa,node', '陕ICP备17015475号-4', 'wkiwi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adv`
--
ALTER TABLE `adv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classify` (`classify`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classify`
--
ALTER TABLE `classify`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_id` (`article_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nav`
--
ALTER TABLE `nav`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `praise`
--
ALTER TABLE `praise`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_id` (`article_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `recommend`
--
ALTER TABLE `recommend`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `website`
--
ALTER TABLE `website`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adv`
--
ALTER TABLE `adv`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `classify`
--
ALTER TABLE `classify`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `link`
--
ALTER TABLE `link`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `nav`
--
ALTER TABLE `nav`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `praise`
--
ALTER TABLE `praise`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `recommend`
--
ALTER TABLE `recommend`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `website`
--
ALTER TABLE `website`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
