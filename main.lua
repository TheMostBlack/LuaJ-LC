
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"

import "other"
import "java.io.File"
import "com.androlua.LuaUtil"
import "com.androlua.LuaAdapter"

import "android.support.v4.widget.*"
  
  
import "android.graphics.drawable.ColorDrawable"
import "android.graphics.drawable.StateListDrawable"
import "android.graphics.PorterDuffColorFilter"
import "android.graphics.PorterDuff"
import "Dialog"
import "java.io.File"
import "android.graphics.Color"
import "android.graphics.drawable.GradientDrawable"
import "android.graphics.drawable.RippleDrawable"
import "android.content.res.ColorStateList"
import "android.graphics.drawable.ShapeDrawable"
import "android.graphics.drawable.shapes.RectShape"
import "android.graphics.Path"
import "android.graphics.Canvas"
import "com.baoyz.widget.PullRefreshLayout"

activity.setTitle("LuaJ++LC")

颜色1=0xffffffff
颜色3=0xff303030
颜色4=0xff757575
颜色2=0xFFF2F1F6
颜色5=0x5FFFFFFF


local yz=io.open(activity.getLuaDir().."/Verify/set3.XY"):read("*a")
if yz=="不在提示" then
else
AlertDialog.Builder(this)
.setTitle("软件使用许可协议")
.setMessage("本软件许可使用协议（以下称\"本协议\"）由您与LuaJ++LC官方（以下称“我们”）共同签署。\n\n在使用“ LuaJ++LC ”软件（以下称许可软件）之前，请您仔细阅读本协议，特别是免除或者限制责任的条款、法律适用和争议解决条款。免除或者限制责任的条款将以粗体标识，您需要重点阅读。如您对协议有任何疑问，可向客服咨询。如果您同意接受本协议条款和条件的约束，您可下载安装使用许可软件。\n\n由于互联网高速发展，您与我们签署的本协议列明的条款并不能完整罗列并覆盖您与我们所有权利与义务，现有的约定也不能保证完全符合未来发展的需求。因此，LuaJ++LC开发软件平台《法律声明及隐私权政策》、LuaJ++LC开发软件平台规则均为本协议的补充协议，与本协议不可分割且具有同等法律效力。如您使用许可软件，视为您同意上述补充协议。如您注册或登录LuaJ++LC开发软件账户，针对您在使用LuaJ++LC开发软件平台服务过程中与我们的权利义务，您与我们可适用《LuaJ++LC开发软件平台服务协议》。\n\n我们如修改本协议或其补充协议，协议条款修改后，请您仔细阅读并接受修改后的协议后再继续使用许可软件。\n\n \n\n一、 定义\n\n1.  许可软件：是指由我们开发的，供您从下载平台下载，并仅限在相应系统手持移动终端中安装、使用的软件系统。\n\n2.  LuaJ++LC开发软件服务：由Most Black开发者为您提供的服务。您可以通过许可软件在手持移动终端使用LuaJ++LC开发软件服务。\n\n \n\n二、 授权范围\n\n1.  由于软件适配平台及终端限制，您理解您仅可在获授权的系统平台及终端使用许可软件，如您将许可软件安装在其他终端设备上（包括台式电脑、手提电脑、或授权终端外的其他手持移动终端、电视机及机顶盒等），可能会对您硬件或软件功能造成损害。\n\n2.  您应该理解许可软件仅可用于非商业目的，您不可为商业运营目的安装、使用、运行许可软件。\n\n3.  我们会对许可软件及其相关功能不时进行变更、升级、修改或转移，并会在许可软件系统中开发新的功能或其它服务。上述新的功能、软件服务如无独立协议的，您仍可取得相应功能或服务的授权，并可适用本协议。\n\n \n\n三、 使用规范\n\n1.  您应该规范使用许可软件，以下方式是违反使用规范的：\n\n1)  从事违反法律法规政策、破坏公序良俗、损害公共利益的行为。\n\n2)  对许可软件及其中的相关信息擅自出租、出借、复制、修改、链接、转载、汇编、发表、出版、建立镜像站点，借助许可软件发展与之有关的衍生产品、插件、外挂等。\n\n3)  通过非由我们及其关联工作室或者个人开发、授权或认可的第三方兼容软件、系统登录或使用许可软件，或针对许可软件使用非我们及其关联工作室或者个人开发、授权或认证的插件和外挂。\n\n4)  删除许可软件及其他副本上关于版权的信息、内容。修改、删除或避开应用产品中我们为保护知识产权而设置的任何技术措施。\n\n5)  未经我们的书面同意，擅自将许可软件出租、出借或再许可给第三方使用，或在获得许可软件的升级版本的许可使用后，同时使用多个版本的许可使用版本，或分开转让。\n\n6)  复制、反汇编、修改许可软件或其任何部分或制造其衍生作品；对许可软件或者许可软件运行过程中释放在终端中的任何数据及许可软件运行过程中终端与服务器端的交互数据进行复制、修改、挂接运行或创作任何衍生作品，包括使用插件、外挂或非经授权的第三方工具/服务接入许可软件和相关系统等形式。\n\n7)  进行任何危害信息网络安全的行为，包括使用许可软件时以任何方式损坏或破坏许可软件或使其不能运行或超负荷或干扰第三方对许可软件的使用；未经允许进入他人计算机系统并删除、修改、增加存储信息；故意传播恶意程序或病毒以及其他破坏、干扰正常网络信息服务的行为。\n\n8)  利用许可软件发表、传送、传播、储存侵害他人知识产权、商业秘密权等合法权利的内容，或从事欺诈、盗用他人账户、资金等违法犯罪活动。\n\n9)  通过修改或伪造许可软件运行中的指令、数据、数据包，增加、删减、变动许可软件的功能或运行效果，及/或将具有上述用途的软件通过信息网络向公众传播或者运营。\n\n10) 其他以任何不合法的方式、为任何不合法的目的、或以任何与本协议不一致的方式使用许可软件。\n\n2.  您理解并同意\n\n1)  我们会对您是否涉嫌违反上述使用规范做出认定，并根据认定结果中止、终止对您的使用许可或采取其他依约可采取的限制措施。\n\n2)  对于您使用许可软件时发布的涉嫌违法或涉嫌侵犯他人合法权利或违反本协议的信息，我们会直接予以删除。\n\n3)  对于您违反上述使用规范的行为对任意第三方造成损害的，您需要以自己的名义独立承担法律责任，并应确保我们免于因此产生损失或增加费用。\n\n4)  如您违反有关法律或者本协议之规定，使我们遭受任何损失，或受到任何第三方的索赔，或受到任何行政管理部门的处罚，您应当赔偿我们因此造成的损失及（或）发生的费用，包括合理的律师费用、调查取证费用。\n\n \n\n四、 第三方软件或服务\n\n1.  许可软件可能使用或包含了由第三方提供的软件或服务（以下称该等服务），该等服务是为了向您提供便利而设置，是取得该第三方的合法授权的。\n\n2.  由于第三方为其软件或服务的提供者，您使用该等服务时，应另行与该第三方达成服务协议，支付相应费用并承担可能的风险。您应理解我们并无权在本协议中授予您使用该等服务的任何权利，也无权对该等服务提供任何形式的保证。我们无法对该等服务提供客户支持，如果您需要获取支持，您可直接与该第三方联系。因您使用该等服务引发的任何纠纷，您可直接与该第三方协商解决。\n\n3.  您理解许可软件仅在当前使用或包含该等服务，我们无法保证许可软件将会永久地使用或包含该等服务，也无法保证将来不会使用或包含该第三方的同类型或不同类型的软件或服务或其他第三方的软件或服务，一旦我们在许可软件中使用或包含前述软件或服务，相应的软件或服务同样适用本条约定。\n\n4.  您理解第三方需要与我们进行您的信息交互以便更好地为您提供服务，您同意在使用许可软件时如使用该等服务的，您授权我们依据《法律声明及隐私权政策》将您使用许可软件的信息传递给该第三方，或从该第三方获取您注册或使用该等服务时提供或产生的信息。如果您不希望第三方获取您的信息的，您可停止使用该等服务.\n\n5.  您同意，如果该第三方确认您违反了您与其之间关于使用该等服务的协议约定停止对您提供该等服务并要求我们处理的，由于停止该等服务可能会影响您继续使用许可软件，我们可能会中止、终止对你的使用许可或采取其他我们可对您采取的限制措施。\n\n \n\n五、 隐私政策与数据\n\n保护您的个人信息对我们很重要。我们制定了《法律声明及隐私权政策》对知识产权归属及保护、您的信息收集、使用、共享、存储、保护等方面关系您切身利益的内容进行了重要披露。我们建议您完整地阅读《法律声明及隐私权政策》（点击查看 ），以帮助您更好的保护您的个人信息。\n\n \n\n六、 特别授权\n\n您对您的个人信息依法拥有权利，并且可以通过查阅《法律声明及隐私权政策》了解我们对您的个人信息的保护及处理方式。对您提供的除个人信息外的信息，为了向您提供您使用的各项服务，并维护、改进这些服务，及优化我们的服务质量等用途，对于您提交的文字、图片和视频等受知识产权保护的内容，您同意授予我们排他的、可转让、可分发次级许可、无使用费的全球性许可，用于我们及我们关联公司使用、复制、修订、改写、发布、翻译、分发、执行和展示您提交的资料数据或制作派生作品。\n\n \n\n七、 无担保和责任限制\n\n1.  除法律法规有明确规定外，我们将尽最大努力确保许可软件及其所涉及的技术及信息安全、有效、准确、可靠，但受限于现有技术，您理解我们不能对此进行担保。\n\n2.  您理解，对于不可抗力及第三方原因导致的您的直接或间接损失，我们无法承担责任。\n\n3.  由于您因下述任一情况所引起或与此有关的人身伤害或附带的、间接的损害赔偿，包括但不限于利润损失、资料损失、业务中断的损害赔偿或其它商业损害赔偿或损失，需由您自行承担：\n\n1)  使用或未能使用许可软件；\n\n2)  第三方未经批准的使用许可软件或更改您的数据；\n\n3)  使用许可软件进行的行为产生的费用及损失；\n\n4)  您对许可软件的误解；\n\n5)  非因我们的原因而引起的与许可软件有关的其它损失。\n\n4.  非经我们或我们授权开发并正式发布的其它任何由许可软件衍生的软件均属非法，下载、安装、使用此类软件，可能导致不可预知的风险，由此产生的法律责任与纠纷与我们无关，我们有权中止、终止使用许可和/或其他一切服务。\n\n5.  您与其他使用许可软件的用户之间通过许可软件进行时，因您受误导或欺骗而导致或可能导致的任何心理、生理上的伤害以及经济上的损失，均应由过错方依法承担所有责任。\n\n \n\n八、 知识产权\n\n1.  我们拥有许可软件的著作权、商业秘密以及其他相关的知识产权，包括与许可软件有关的各种文档资料。\n\n2.  许可软件的相关标识属于我们及我们的关联工作室或者个人的知识产权，并受到相关法律法规的保护。未经我们明确授权，您不得复制、模仿、使用或发布上述标识，也不得修改或删除应用产品中体现我们及其关联工作室的任何标识或身份信息。\n\n3.  未经我们及我们的关联工作室或者个人事先书面同意，您不得为任何营利性或非营利性的目的自行实施、利用、转让或许可任何第三方实施、利用、转让上述知识产权。\n\n \n\n九、 协议终止和违约责任\n\n1.  您应理解按授权范围使用许可软件、尊重软件及软件包含内容的知识产权、按规范使用软件、按本协议约定履行义务是您获取我们授权使用软件的前提，如您严重违反本协议，我们将终止使用许可。\n\n2.  您对软件的使用有赖于我们关联工作室为您提供的配套服务，您违反与我们或我们关联工作室的条款、协议、规则、通告等相关规定，而被上述任一网站终止提供服务的，可能导致您无法正常使用许可软件，我们有权终止使用许可。\n\n3． 您理解出于维护平台秩序及保护消费者权益的目的，如果您向我们及（或）我们的关联工作室作出任何形式的承诺，且相关公司已确认您违反了该承诺并通知我们依据您与其相关约定进行处理的，则我们可按您的承诺或协议约定的方式对您的使用许可及其他我们可控制的权益采取限制措施，包括中止或终止对您的使用许可。\n\n4.  一旦您违反本协议或与我们签订的其他协议的约定，我们可通知我们关联工作室或者个人，要求其对您的权益采取限制措施，包括要求关联公司中止、终止对您提供部分或全部服务，且在其经营或实际控制的网站依法公示您的违约情况。\n\n5.  许可软件由您自下载平台下载取得，您需要遵守下载平台、系统平台、终端厂商对您使用许可软件方式与限制的约定，如果上述第三方确认您违反该约定需要我们处理的，我们可能会因第三方要求终止对您的使用许可。\n\n6.  在本使用许可终止时，您应停止对许可软件的使用行为, 并销毁许可软件的全部副本。\n\n7.  如您违反本协议规定的条款，给我们或其他用户造成损失，您必须承担全部的赔偿责任。如我们承担了上述责任，则您同意赔偿我们的相关支出和损失，包括合理的律师费用。\n\n \n\n十、 管辖法律和可分割性\n\n1.  本协议之效力、解释、变更、执行与争议解决均适用中华人民共和国法律，如无相关法律规定的，则应参照通用国际商业惯例和（或）行业惯例。\n\n2.  本协议由您与我们于我们服务器所在地签署。因本协议产生或与本协议有关的争议，您可与我们以友好协商的方式予以解决或提交有管辖权的人民法院予以裁决。\n\n3.  本协议任何条款被有管辖权的人民法院裁定为无效，不应影响其他条款或其任何部分的效力，您与我们仍应善意履行。\n\n \n\n十一、   其他\n\n1.  我们可能根据业务调整而变更向您提供软件服务的主体，变更后的主体与您共同履行本协议并向您提供服务，以上变更不会影响您本协议项下的权益。发生争议时，您可根据您具体使用的服务及对您权益产生影响的具体行为对象确定与您履约的主体及争议相对方。\n\n2.  本协议的所有标题仅仅是为了醒目及阅读方便，本身并没有实际涵义，不能作为解释本协议涵义的依据。")
.setPositiveButton("确定",function()
  end)
  .show();

AlertDialog.Builder(this)
  .setTitle("隐私政策")
  .setMessage("我们尊重和保护用户的隐私。本隐私政策将告诉您我们如何收集和使用有关您的信息，以及我们如何保护这些信息的安全。\n\n您成为用户前务必仔细阅读本隐私条款并同意所有隐私条款。本隐私政策条款在您注册成为LuaJ++LC用户后立即生效，并对您及LuaJ++LC产生约束力。\n\n一、我们可能收集的用户信息\n\n我们提供服务时，可能会收集、储存和使用下列与您有关的信息。如果您不提供相关信息，可能无法注册成为我们的用户或无法享受我们提供的某些服务，或者无法达到相关服务拟达到的效果。\n\n1、您提供的信息\n\n•您在注册账户或使用我们的服务时，向我们提供的相关个人信息，例如电话号码、性别、出生日期等。\n\n•您通过我们的服务向其他方提供的共享信息，以及您使用我们的服务时所储存的信息。\n\n2、其他方分享的您的信息\n\n•其他方使用我们的服务时所提供有关您的共享信息。\n\n3、我们获取的您的信息\n\n您使用服务时我们可能收集如下信息：\n\n•日志信息，指您使用我们的服务时，系统可能通过cookies、web beacon或其他方式自动采集的技术信息，包括：设备或软件信息，例如您的移动设备、网页浏览器或用于接入我们服务的其他程序所提供的配置信息、您的IP地址和移动设备所用的版本和设备识别码；以及您在使用我们服务时要求提供的其他信息和内容详情。\n\n•位置信息，指您开启设备定位功能并使用我们基于位置提供的相关服务时，收集的有关您位置的信息。您可以通过关闭定位功能，停止对您的地理位置信息的收集。\n\n•交易信息，指我们对您在LuaJ++LC平台上形成的交易数据信息进行分析并形成用户信用数据库。\n\n二、我们可能如何使用用户信息\n\n•在我们提供服务时，用于身份验证、客户服务、安全防范、诈骗监测、存档和备份用途，确保我们向您提供的产品和服务的安全性；\n\n•帮助我们设计新服务，改善我们现有服务；\n\n•使我们更加了解您如何接入和使用我们的服务，从而针对性地回应您的个性化需求；\n\n•软件认证或管理软件升级；\n\n•让您参与有关我们产品和服务的调查。\n\n为了让您有更好的体验、改善我们的服务或您同意的其他用途，在符合相关法律法规的前提下，我们可能将通过某一项服务所收集的信息，以汇集信息或者个性化的方式，用于我们的其他服务。例如，在您使用我们的一项服务时所收集的信息，可能在另一服务中用于向您提供特定内容，或向您展示与您相关的、非普遍推送的信息。如果我们在相关服务中提供了相应选项，您也可以授权我们将该服务所提供和储存的信息用于我们的其他服务。\n\n三、我们可能与第三方共享的用户信息\n\n在下列情况下，我们可能会共享您的个人信息：\n\n•其他注册用户就您在LuaJ++LC活动中的违约行为发起诉讼程序时，我们将应该等注册用户的请求向该等注册用户披露您的用户信息；\n\n•应行政、司法部门的要求向该等机构提供您的用户信息；\n\n•您通过LuaJ++LC平台向第三方合作机构申请相关产品服务时，我们将根据您的授权向第三方提供您的用户信息；\n\n•我们以及我们的关联公司，可能将您的个人信息与我们的关联公司、合作伙伴及第三方服务供应商、承包商及代理（例如代表我们发出短信或推送通知的通讯服务提供商、为我们提供位置数据的地图服务供应商）分享（他们可能并非位于您所在的法域），为了我们向您提供或改善我们的服务；\n\n•随着我们业务的持续发展，我们以及我们的关联公司有可能进行合并、收购、资产转让或类似的交易，您的个人信息有可能作为此类交易的一部分而被转移；\n\n•依据法律要求必须向第三方提供您的用户信息的情形；\n\n四、我们如何保护用户信息\n\n我们使用各种安全技术和程序，以防信息的丢失、不当使用、未经授权阅览或披露。但请您理解，由于技术的限制以及可能存在的各种恶意手段，在互联网行业，即便竭尽所能加强安全措施，也不可能始终保证信息百分之百的安全。您需要了解，您接入我们的服务所用的系统和通讯网络，有可能因我们可控范围外的因素而出现问题。\n\n五、隐私政策的修改\n\n由于法律法规的变更，以及为了与互联网的新发展和可能的发展趋势保持同步，我们可能会不定时修改本政策。因此，我们保留自行决定实施此类修改的权利，如该等修订造成您在本《隐私政策》下权利的实质减少，我们将在修订生效前通过在主页上显著位置提示或向您推送通知或以其他方式通知您。在该种情况下，若您继续使用我们的服务，即表示同意受经修订的本《隐私政策》的约束。")
.setPositiveButton("确定",{onClick=function()
写入文件(activity.getLuaDir().."/Verify/set3.XY","不在提示")
end})
.show();
AlertDialog.Builder(this)
.setTitle("欢迎使用LuaJ++LC")
  .setMessage("LuaJ++LC基于LuaJ++\n使用LuaJ++LC产生的任何后果均与LuaJ++LC及作者无关")
  .setPositiveButton("确定",function()
  end)
  .show();
  print"LuaJ++LC不提倡开发外挂"
  end



  project={
    RelativeLayout;
    layout_width="fill";
  layout_height="fill";
  background="#000000";
  {
  LinearLayout;
  layout_height="-1";
  layout_width="-1";
    };


    {
    DrawerLayout;
    
    layout_height="fill";
    layout_width="fill";
      id="优化",

      {
      PullRefreshLayout;
    backgroundColor=颜色2;
    layout_height="fill";
      layout_width="fill";
        id="sx";

          {
          ListView;
        id="项目列表";
      DividerHeight=0;
    verticalScrollBarEnabled=false;
    
    layout_width="fill";

    };
    };
    };
    };



    layout={
    LinearLayout;
    orientation="vertical";
    layout_width="fill";
    layout_height="fill";

    {
    LinearLayout;
    gravity="center";
    layout_height="8.2%h";
    orientation="horizontal";
    backgroundColor=颜色1;
    layout_width="fill";
    {
    CircleImageView;
    layout_width="9.7%w";
    layout_gravity="center";
    layout_marginRight="5.5%w";
    src="icon.png";
    layout_height="5.1%h";
    };
    {
    LinearLayout;
    layout_marginRight="5.5%w";
    layout_height="5.1%h";
    layout_width="47.2%w";
    layout_gravity="center";
    {
    TextView;
    textSize="16sp";
    textColor=颜色3;
    layout_gravity="center";
    layout_marginLeft="5.5%w";
    id="用户名";
    text="LuaJ++LC";
    };
    };
    {
    ImageView;
    ColorFilter=颜色3;
    layout_width="9.7%w";
    layout_gravity="center";
    layout_marginRight="15dp";
    id="添加";
    src="imgs/Add.png";
    layout_height="5.1%h";
    };
    {
    ImageView;
    ColorFilter=颜色3;
    layout_width="9.7%w";
    layout_gravity="center";
    id="其他";
    src="imgs/Other.png";
    layout_height="5.1%h";
    };
    };
    {

    PageView;
    pages={
    project;
    
    
    
    };
    id="pagev";
    
    };

    };


    activity.setContentView(loadlayout(layout))
    
    activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(颜色1);
    if tonumber(Build.VERSION.SDK) >= 23 then
    activity.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
    end
    import "android.graphics.Typeface"
    local Text_Type=Typeface.defaultFromStyle(Typeface.BOLD)
    local sd = StateListDrawable()
    import "android.graphics.Color"
    import "android.content.res.ColorStateList"
    import "android.graphics.drawable.RippleDrawable"
    import "android.content.Context"
    appt={C_Bacgg=function(mBinding,radiu,InsideColor,S,S2,T1)
    local drawable = GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM,{});
    drawable.setCornerRadius(radiu);
    drawable.setColor(颜色5)
    drawable.setStroke(3, 0xCFB0B0B0)
    drawable.setGradientType(GradientDrawable.RECTANGLE);
    mBinding.setTextColor(T1)
    mBinding.setTypeface(Text_Type)
    return drawable
    end}
    美化按钮1=function(mBinding,radiu,InsideColor,T1)
    stateList = {
    {android.R.attr.state_pressed},
    {android.R.attr.state_focused},
    {android.R.attr.state_activated},
    {android.R.attr.selectableItemBackground},
    };
    sd.addState({ android.R.attr.state_enabled}, appt.C_Bacgg(mBinding,radiu,InsideColor,S,S2,T1))
    pressedColor =InsideColor 
    stateColorList ={
    pressedColor,
    pressedColor,
    pressedColor,
    normalColor
    };
    colorStateList = ColorStateList(stateList, stateColorList);
    rippleDrawable = RippleDrawable(colorStateList,sd,nil);
    mBinding.setBackground(rippleDrawable);
    end

    波纹(其他,0xFFD9D9D9)
    

    projectitem={
    LinearLayout;
    layout_height="fill";
    layout_width="fill";
    gravity="center";
    {
    LinearLayout;
    layout_height="10.2%h";
    layout_width="fill";
    gravity="center";
    {
    CardView;
    layout_height="8.8%h";
    backgroundColor=颜色1;
    layout_width="97.2%w";
    CardElevation=0;
    layout_gravity="center";
    radius=20;
    {
    LinearLayout;
    layout_height="fill";
    layout_width="fill";
    orientation="horizontal";
    {
    ImageView;
    layout_height="6.6%h";
    id="图标";
    layout_width="12.5%w";
    layout_marginLeft="10dp";
    layout_gravity="center";
    src="icon.png";
    };
    {
    LinearLayout;
    layout_height="fill";
    layout_width="fill";
    orientation="vertical";
    {
    LinearLayout;
    layout_width="fill";
    layout_height="4.4%h";
    {
    TextView;
    id="软件名";
    layout_width="fill";
    layout_gravity="center";
    layout_marginTop="4dp";
    layout_marginLeft="10dp";
    text="软件名";
    textSize="16sp";
    textColor=颜色4,
    layout_height="3.6%h";
    };
    };
    {
    LinearLayout;
    layout_width="fill";
    layout_height="fill";
    {
    LinearLayout;
    layout_height="fill";
    layout_gravity="center";
    {
    TextView;
    id="版本";
    textColor=颜色4,
    layout_marginBottom="2dp";
    layout_marginLeft="2.7%w";
    text="版本：";
    textSize="13sp";
    layout_gravity="center";
    };
    };
    {
    LinearLayout;
    layout_height="fill";
    layout_marginLeft="2.7%w";
    {
    TextView;
    id="包名";
    textColor=颜色4,
    layout_marginBottom="2dp";
    layout_marginLeft="3.4%w";
    text="包名：";
    textSize="13sp";
    layout_gravity="center";
    };
    };
    };
    };
    };
    };
    };
    };

    function 刷新项目()
    data={}
    adp=LuaAdapter(activity,data,projectitem)
    项目列表.Adapter=adp

    local a=luajava.astable(File(项目文件夹).listFiles())
    if a[1]==nil then
   else
    for i=1,#a do
    if File(项目文件夹.."/"..a[i].name).isDirectory() then
    if File(项目文件夹.."/"..a[i].name.."/main.lua").isFile() then
    if File(项目文件夹.."/"..a[i].name.."/init.lua").isFile() then
    local b=io.open(项目文件夹.."/"..a[i].name.."/init.lua"):read("*a")
    yz=io.open(项目文件夹.."/"..a[i].name.."/init.lua"):read("*a")
    if yz:find("ver_code") then

    d=b:match('ver_code="(.-)"')
   else
    d="nil"
    end
    if yz:find("package_name") then
    c=b:match('package_name="(.-)"')
   else
    c="nil"
    end
    if yz:find("app_name") then
    aa=b:match('app_name="(.-)"')
   else
    aa="nil"
    end
    if File(项目文件夹.."/"..a[i].name.."/icon.png").isFile() then
    adp.add{图标=项目文件夹.."/"..a[i].name.."/icon.png",软件名=aa,包名="包名："..c,版本="版本："..d}
   else
    adp.add{软件名=aa,包名="包名："..c,版本="版本："..d}
    end
    end
    end
    end
    end
    end
    end
    
    sx.setRefreshStyle(PullRefreshLayout.STYLE_MATERIAL);
    sx.setColor(0xFF03A9F4)
    sx.setDurations(750,250)
    sx.setRefreshing(true);
    task(1050,function()
    sx.setRefreshing(false);
    task(200,function()
    刷新项目()


    end)
    end)
    sx.onRefresh=function(a)


    刷新项目()
    task(1000,function()
    sx.setRefreshing(false);

    end)
    end

    

    function 创建工程()
    local xz={
    CardView;
    radius=30;
    layout_width="match_parent";
    
    layout_height="match_parent";
    {
    CardView;
    layout_gravity="center";
    layout_height="280dp";
    layout_width="match_parent";
    backgroundColor=颜色1,
    radius=20;
    {
    LinearLayout;
    layout_height="match_parent";
    layout_width="match_parent";
    orientation="vertical";
    {
    TextView;
    text="新建工程";
    textColor="0xFF03A9F4";
    textSize="19sp";
    layout_marginLeft="20dp";
    layout_marginTop="15dp";
    };
    {
    FrameLayout;
    layout_marginTop="5dp",
    layout_width="match_parent";
    layout_height="fill";
    {
    ListView;
    id="创建选择",
    items={
    " 参考模板";
    " 默认工程";
    };
    layout_height="match_parent";
    DividerHeight=0;
    layout_width="match_parent";
    };
    };
    };
    };
    };
    dialog= AlertDialog.Builder(this)
    dialog1=dialog.show()
    dialog1.getWindow().setContentView(loadlayout(xz));
    dialog1.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));
    local dialogWindow = dialog1.getWindow();
    dialogWindow.setGravity(Gravity.BOTTOM);
    创建选择.onItemClick=function(l,v,p,i)
    if i==1 then
    dialog1.dismiss()
    mb={
    CardView;
    radius=30;
    layout_width="match_parent";
    
    layout_height="match_parent";
    {
    CardView;
    layout_gravity="center";
    layout_height="280dp";
    layout_width="match_parent";
    backgroundColor=颜色1,
    radius=20;
    {
    LinearLayout;
    layout_height="match_parent";
    layout_width="match_parent";
    orientation="vertical";
    {
    TextView;
    text="参考模板";
    textColor="0xFF03A9F4";
    textSize="18sp";
    layout_marginLeft="20dp";
    layout_marginTop="15dp";
    };
    {
    FrameLayout;
    layout_width="match_parent";
    layout_height="fill";
    {
    ListView;
    id="模板",
    items={
    " 密码进入软件";
    " 美化路径模块";
    " DrawerLayout";
    " TabBar";
    " TitleBar",
    };
    layout_height="match_parent";
    DividerHeight=0;
    layout_width="match_parent";
    };
    };
    };
    };
    };
    dialog= AlertDialog.Builder(this)
    dialog1=dialog.show()
    dialog1.getWindow().setContentView(loadlayout(mb));
    dialog1.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));
    local dialogWindow = dialog1.getWindow();
    dialogWindow.setGravity(Gravity.BOTTOM);

    模板.onItemClick=function(l,v,p,i)
    if i==1 then
    mc="密码进入软件"
    lj="xy1"
   elseif i==2 then
    mc="美化路径模块"
    lj="xy2"
   elseif i==3 then
    mc="DrawerLayout"
    lj="xy3"
   elseif i==4 then
    mc="TabBar"
    lj="xy4"
   elseif i==5 then
    mc="TitleBar"
    lj="xy5"
    end
    LuaUtil.unZip(activity.getLuaDir().."/project/"..lj..".zip",项目文件夹.."/"..mc)
    刷新项目()
    dialog1.dismiss()
    activity.newActivity("main2",android.R.anim.fade_in,android.R.anim.fade_out,{项目文件夹.."/"..mc,true,mc})
    end
   else
    dialog1.dismiss()
    tj=


    {
    CardView;
    radius=30;
    layout_width="match_parent";
    
    layout_height="match_parent";
    {
    CardView;
    layout_gravity="center";
    layout_height="280dp";
    layout_width="match_parent";
    backgroundColor=颜色1,
    radius=20;
    {
    TextView;
    layout_marginTop="15dp";
    layout_marginLeft="20dp";
    textSize="20sp";
    textColor="0xFF03A9F4";
    text="新建工程";
    };
    {
    LinearLayout;
    orientation="horizontal";
    layout_width="match_parent";
    layout_height="150dp";
    gravity="center";
    {
    EditText;
    layout_marginTop="10dp",
    layout_width="320dp";
    gravity="center";
    textSize="15sp";
    hint="请输入工程的名称";
    text="MyApp";
    id="输入名称",
    textColor=颜色4,
    HintTextColor=颜色4,
    };
    };
    {

    LinearLayout;
    orientation="horizontal";
    layout_width="match_parent";
    layout_height="match_parent";
    gravity="center";
    {
    EditText;
    
    layout_width="320dp";
    gravity="center";
    textSize="15sp";
    id="输入包名",
    hintTextColor=颜色4,
    textColor=颜色4,
    hint="请输入工程的包名";
    text="com.Myapp.demo";
    };
    };
    {
    LinearLayout;
    layout_height="match_parent";
    layout_width="match_parent";
    {
    Button;
    id="取消创建工程",
    layout_gravity="center";
    layout_marginLeft="20dp";
    textColor="0x7E000000";
    text="取消";
    layout_marginTop="50dp",
    layout_height="40dp";
    };
    {
    LinearLayout;
    gravity="right";
    layout_width="match_parent";
    layout_height="match_parent";
    {
    Button;
    layout_height="40dp";
    id="确定创建工程",
    layout_marginTop="50dp",
    layout_gravity="center";
    layout_marginRight="20dp";
    textColor="0xFF03A9F4";
    text="创建";
    };
    };
    };
    };
    };


    dialog= AlertDialog.Builder(this)
    dialog1=dialog.show()
    dialog1.getWindow().setContentView(loadlayout(tj));
    dialog1.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));
    local dialogWindow = dialog1.getWindow();
    dialogWindow.setGravity(Gravity.BOTTOM);
    dialog1.getWindow().getAttributes().width=(activity.Width);
    dialog1.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
    美化按钮1(取消创建工程,10,0x7E000000,0x7E000000)
    美化按钮1(确定创建工程,10,0x7a00bfff,0x7a00bfff)
    控件圆角(输入名称,0xFFF2F1F6,30)
    控件圆角(输入包名,0xFFF2F1F6,30)
    function 确定创建工程.onClick()
    if #输入名称.text~=0 then
    if #输入包名.text~=0 then
    if File(项目文件夹.."/"..输入名称.text).isDirectory() then
    print"工程已存在"
   else
    main=[[
activity.Debug=true
import "android.app.*"
import "android.widget.*"
import "com.androlua.*"
import "java.lang.*"
import "java.util.*"
import "res"
activity.setContentView(res.layout.main)

]]
    init=[[
app_name="MyApp"
ver_name="1.0"
ver_code="1"
package_name="org.luaj.LC.MyApp"
theme="Theme_DeviceDefault"
developer=""
description=""
debug_mode=true
user_permission={
  "INTERNET",
  "WRITE_EXTERNAL_STORAGE"
}
]]
    layout1=[[
{
  import "android.widget.*";
  LinearLayout,
  orientation="vertical",
  layout_width="fill",
  layout_height="fill",
  {
    TextView,
    id="tv",
    text="Hello LuaJ++LC",
    layout_width="fill",
  },
}
]]
    创建文件夹(项目文件夹.."/"..输入名称.text)
    main1=string.gsub(main,"Myapp",输入名称.text)
    写入文件(项目文件夹.."/"..输入名称.text.."/main.lua",main1)
    init1=string.gsub(init,'app_name="MyApp"','app_name="'..输入名称.text..'"')
    init2=string.gsub(init1,"org.luaj.LC.MyApp",输入包名.text)
    写入文件(项目文件夹.."/"..输入名称.text.."/init.lua",init2)
    创建文件夹(项目文件夹.."/"..输入名称.text.."/res/")
    创建文件夹(项目文件夹.."/"..输入名称.text.."/res/layout/")
    io.open(项目文件夹.."/"..输入名称.text.."/res/layout/main.lua","w")

    创建文件夹(项目文件夹.."/"..输入名称.text.."/res/string/")
    io.open(项目文件夹.."/"..输入名称.text.."/res/string/init.lua","w")

    写入文件(项目文件夹.."/"..输入名称.text.."/res/layout/main.lua",layout1)
    写入文件(项目文件夹.."/"..输入名称.text.."/res/string/init.lua","appname="..'"'..输入名称.text..'"')
    创建文件夹(项目文件夹.."/"..输入名称.text.."/res/drawable/")

    sx.setRefreshing(true);
    task(10,function()
    sx.setRefreshing(false);
    刷新项目()
    if File(项目文件夹.."/"..输入名称.text).isDirectory() then
    print"创建成功"
    activity.newActivity("main2",android.R.anim.fade_in,android.R.anim.fade_out,{项目文件夹.."/"..输入名称.text,true,输入名称.text})
    dialog1.dismiss()
   else print"创建失败"
    end
    end)
    end
   else
    print"请输入工程包名"
    end
   else
    print"请输入工程名称"
    end
    end
    function 取消创建工程.onClick()
    dialog1.dismiss()
    end
    end
    end
    end
    function 添加.onClick()
    a=io.open(activity.getLuaDir().."/Verify/set1.XY"):read("*a")
    if a=="0" then
    创建工程()
   else
    if a=="1" then

    end
    end
    end

    function 其他.onClick()
    pop=PopupMenu(activity,其他)
    menu=pop.Menu

    menu.add("创建工程").onMenuItemClick=function(a)
    创建工程()
    end
    menu.add("导入工程").onMenuItemClick=function(a)
    activity.newActivity("file",android.R.anim.fade_in,android.R.anim.fade_out)
    function onResult(name,arg)
    if name=="file" then
    sx.setRefreshing(true);
    task(10,function()
    sx.setRefreshing(false);
    刷新项目()
    print("导入成功")
    end)

   else

    end

    end

    end
    menu.add("教程手册").onMenuItemClick=function(a)
    activity.newActivity("main3",android.R.anim.fade_in,android.R.anim.fade_out)
    end
    pop.show()
    end
    项目列表.onItemClick=function(l,v,p,i)
    activity.newActivity("main2",android.R.anim.fade_in,android.R.anim.fade_out,{项目文件夹.."/"..v.tag.软件名.text,true,v.tag.软件名.text})
    return true
    end
    项目列表.onItemLongClick=function(l,v,p,i)
    标题=v.tag.软件名.text
    ca={
    CardView;
    radius=30;
    layout_width="match_parent";
    
    layout_height="match_parent";
    {
    CardView;
    layout_gravity="center";
    layout_height="280dp";
    layout_width="match_parent";
    backgroundColor=颜色1,
    radius=20;
    {
    TextView;
    text="项目操作";
    layout_marginTop="10dp";
    textSize="20sp";
    layout_marginLeft="25dp";
    textColor="0xFF03A9F4";
    };

    {
    ListView;
    id="项目操作";
    items={
    "";
    " 删除";
    " 打包";
    " 属性";
    " 分享";
    
    };
    layout_height="fill";
    backgroundColor="0xffffff";
    DividerHeight=0;
    layout_width="fill";
    };
    };
    };


    dialog= AlertDialog.Builder(this)
    dialog1=dialog.show()
    dialog1.getWindow().setContentView(loadlayout(ca));
    dialog1.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));
    local dialogWindow = dialog1.getWindow();
    dialogWindow.setGravity(Gravity.BOTTOM);
    dialog1.getWindow().getAttributes().width=(activity.Width);
    dialog1.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
    项目操作.onItemClick=function(l,v,p,i)
    if p==1 then
    a= LuaUtil.rmDir(File(项目文件夹.."/"..标题))
    刷新项目()
    if a==true then
    print"删除成功"
   else
    print"删除失败"
    end
    dialog1.dismiss()
   elseif p==2 then
    import "java.util.zip.ZipOutputStream"
    import "android.net.Uri"
    import "java.io.File"
    import "android.widget.Toast"
    import "java.util.zip.CheckedInputStream"
    import "java.io.FileInputStream"
    import "android.content.Intent"
    import "java.security.Signer"
    import "java.util.ArrayList"
    import "java.io.FileOutputStream"
    import "java.io.BufferedOutputStream"
    import "java.util.zip.ZipInputStream"
    import "java.io.BufferedInputStream"
    import "java.util.zip.ZipEntry"
    import "android.app.ProgressDialog"
    import "java.util.zip.CheckedOutputStream"
    import "java.util.zip.Adler32"
    import "com.androlua.LuaUtil"

    local bin_dlg, error_dlg
    local function update(s)
    bin_dlg.setMessage(s)
    end

    local function callback(s)
    LuaUtil.rmDir(File(activity.getLuaExtDir("bin/.temp")))
    bin_dlg.hide()
    bin_dlg.Message = ""
    if not s:find("成功") then
    error_dlg.Message = s
    error_dlg.show()
    end
    end

    local function create_bin_dlg()
    if bin_dlg then
    return
    end
    bin_dlg = ProgressDialog(activity);
    bin_dlg.setTitle("正在打包");
    bin_dlg.setMax(100);
    end

    local function create_error_dlg2()
    if error_dlg then
    return
    end
    
    end

    local bin_dlg, error_dlg
    local function update(s)
    bin_dlg.setMessage(s)
    end

    local function callback(s)
    LuaUtil.rmDir(File(activity.getLuaExtDir("bin/.temp")))
    bin_dlg.hide()
    bin_dlg.Message = ""
    if not s:find("成功") then
    error_dlg.Message = s
    error_dlg.show()
    end
    end

    local function create_bin_dlg()
    if bin_dlg then
    return
    end
    bin_dlg = ProgressDialog(activity);
    bin_dlg.setTitle("正在打包");
    bin_dlg.setMax(100);
    end

    local function create_error_dlg2()
    if error_dlg then
    return
    end
    
    end
    create_bin_dlg()
    bin_dlg.show()
    update("正在打包")
    local function binapk(luapath,apkpath)
    


    local function ps(str)
    str = str:gsub("%b\"\"",""):gsub("%b\'\'","")
    local _,f= str:gsub ('%f[%w]function%f[%W]',"")
    local _,t= str:gsub ('%f[%w]then%f[%W]',"")
    local _,i= str:gsub ('%f[%w]elseif%f[%W]',"")
    local _,d= str:gsub ('%f[%w]do%f[%W]',"")
    local _,e= str:gsub ('%f[%w]end%f[%W]',"")
    local _,r= str:gsub ('%f[%w]repeat%f[%W]',"")
    local _,u= str:gsub ('%f[%w]until%f[%W]',"")
    local _,a= str:gsub ("{","")
    local _,b= str:gsub ("}","")
    return (f+t+d+r+a)*4-(i+e+u+b)*4
    end


    local function _format()
    local p=0
    return function(str)
    str=str:gsub("[ \t]+$","")
    str=string.format('%s%s',string.rep(' ',p),str)
    p=p+ps(str)
    return str
    end
    end


    function format(Text)
    local t=os.clock()
    local Format=_format()
    Text=Text:gsub('[ \t]*([^\r\n]+)',function(str)return Format(str)end)
    print('操作完成,耗时:'..os.clock()-t)
    return Text
    end


    function build(path)
    if path then
    local str,st=loadfile(path)
    if st then
    return nil,st
    end
    local path=path..'c'

    local st,str=pcall(string.dump,str,true)
    if st then
    f=io.open(path,'wb')
    f:write(str)
    f:close()
    return path
   else
    os.remove(path)
    return nil,str
    end
    end
    end

    function build_aly(path2)
    if path2 then
    local f,st=io.open(path2)
    if st then
    return nil,st
    end
    local str=f:read("*a")
    f:close()
    str=string.format("local layout=%s\nreturn layout",str)
    local path=path2..'c'
    str,st=loadstring(str,path2:match("[^/]+/[^/]+$"),"bt")
    if st then
    return nil,st:gsub("%b[]",path2,1)
    end

    local st,str=pcall(string.dump,str,true)
    if st then
    f=io.open(path,'wb')
    f:write(str)
    f:close()
    return path
   else
    os.remove(path)
    return nil,str
    end
    end
    end


    
    
    import "java.util.zip.*"
    import "java.io.*"
    import "mao.res.*"
    import "apksigner.*"
    local b = byte[2 ^ 16]
    local function copy(input, output)
    LuaUtil.copyFile(input, output)
    input.close()
    
    end

    local function copy2(input, output)
    LuaUtil.copyFile(input, output)
    end

    local temp = File(apkpath).getParentFile();
    if (not temp.exists()) then

    if (not temp.mkdirs()) then

    error("create file " .. temp.getName() .. " fail");
    end
    end


    local tmp = activity.getLuaPath("tmp.apk")
    local info = activity.getApplicationInfo()
    local ver = activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0).versionName
    local code = activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0).versionCode

    
    local zipFile = File(info.publicSourceDir)
    local fis = FileInputStream(zipFile);
    
    local zis = ZipInputStream(BufferedInputStream(fis));

    local fot = FileOutputStream(tmp)
    

    local out = ZipOutputStream(BufferedOutputStream(fot))
    local f = File(luapath)
    local errbuffer = {}
    local replace = {}
    local checked = {}
    local lualib = {}
    local md5s = {}
    local libs = File(activity.ApplicationInfo.nativeLibraryDir).list()




    local function checklib(path)
    if checked[path] then
    return
    end
    local cp, lp
    checked[path] = true
    local f = io.open(path)
    local s = f:read("*a")
    f:close()


    end

    local function addDir(out, dir, f)
    local entry = ZipEntry("assets/" .. dir)
    out.putNextEntry(entry)
    local ls = f.listFiles()

    for n = 0, #ls - 1 do
    local name = ls[n].getName()
    if name==(".using") then
    checklib(luapath .. dir .. name)
   elseif name:find("%.apk$") or name:find("%.luac$") or name:find("^%.") then
   elseif name:find("%.lua$") then
    checklib(luapath .. dir .. name)
    local path, err = build(luapath .. dir .. name)

    if path then
    if replace["assets/" .. dir .. name] then
    table.insert(errbuffer, dir .. name .. "/.aly")
    end
    local entry = ZipEntry("assets/" .. dir .. name)
    out.putNextEntry(entry)

    replace["assets/" .. dir .. name] = true
    copy(FileInputStream(File(path)), out)
    table.insert(md5s, LuaUtil.getFileMD5(path))
    os.remove(path)
   else
    table.insert(errbuffer, err)
    end

   elseif ls[n].isDirectory() then
    addDir(out, dir .. name .. "/", ls[n])
   else
    local entry = ZipEntry("assets/" .. dir .. name)
    out.putNextEntry(entry)
    replace["assets/" .. dir .. name] = true
    copy(FileInputStream(ls[n]), out)
    table.insert(md5s, LuaUtil.getFileMD5(ls[n]))
    end
    end
    end

    if f.isDirectory() then
    import "android.content.pm.PackageManager"
    local pm = activity.getPackageManager();
    local pi = pm.getPackageInfo(activity.getPackageName(), 0);
    
    local pkgName = pi.packageName;

    local pkgInfo = pm.getPackageInfo(pkgName,
    PackageManager.GET_PERMISSIONS); 
    local sharedPkgList = pkgInfo.requestedPermissions; 
    permission = {}
    permission_info = {}
    permission_info["BIND_ACCESSIBILITY_SERVICE"] = "辅助功能"
    for i = 0, #sharedPkgList - 1 do
    local permName = sharedPkgList[i];
    
    local s, tmpPermInfo = pcall(pm.getPermissionInfo, permName, 0); 

    
    
    
    
    
    
    permName = permName:match("%.([%w_]+)$")
    table.insert(permission, permName)
    if s then
    permission_info[permName] = tmpPermInfo.loadLabel(pm)
   else
    permission_info[permName] = permName
    end
    end

    dofile(luapath .. "init.lua")
    if user_permission then
    for k, v in ipairs(user_permission) do
    user_permission[v] = true
    end
    end




    local ss, ee = pcall(addDir, out, "", f)
    if not ss then
    table.insert(errbuffer, ee)
    end

    local wel = File(luapath .. "icon.png")

    if wel.exists() then
    local entry = ZipEntry("res/drawable/icon.png")
    out.putNextEntry(entry)

    replace["res/drawable/icon.png"] = true
    copy(FileInputStream(wel), out)

    end
    local wel = File(luapath .. "welcome.png")
    if wel.exists() then
    local entry = ZipEntry("res/drawable/welcome.png")
    out.putNextEntry(entry)
    replace["res/drawable/welcome.png"] = true
    copy(FileInputStream(wel), out)
    end
   else
    return "error"
    end



    
    for name, v in pairs(lualib) do

    local path, err = build(v)
    if path then
    local entry = ZipEntry(name)
    out.putNextEntry(entry)
    copy(FileInputStream(File(path)), out)
    table.insert(md5s, LuaUtil.getFileMD5(path))
    os.remove(path)
   else
    table.insert(errbuffer, err)
    end
    end

    function touint32(i)
    local code = string.format("%08x", i)
    local uint = {}
    for n in code:gmatch("..") do
    table.insert(uint, 1, string.char(tonumber(n, 16)))
    end
    return table.concat(uint)
    end

    update("正在签名")
    local entry = zis.getNextEntry();
    while entry do
    local name = entry.getName()

    local lib = name:match("([^/]+%.so)$")
    if replace[name] then
   elseif lib and replace[lib] then
   elseif name:find("^assets/") then
    
   elseif name:find("META%-INF") then
   elseif !name:find("%a") then
   else
    local entry = ZipEntry(name)
    out.putNextEntry(entry)
    if entry.getName() == "AndroidManifest.xml" then
    if path_pattern and #path_pattern > 1 then
    path_pattern = ".*\\\\." .. path_pattern:match("%w+$")
    end
    local list = ArrayList()
    local xml = AXmlDecoder.read(list, zis)
    local req = {
    [activity.getPackageName()] = package_name,
    [info.nonLocalizedLabel] = app_name,
    [ver] = ver_name,
    [".*\\\\.lua"] = "",
    [".*\\\\.luac"] = "",
    }
    if path_pattern==nil or path_pattern=="" then
    req[".*\\\\.alp"] = ""
    req["application/alp"] = "application/1234567890"
   else
    path_pattern=path_pattern:match("%w+$") or path_pattern
    req[".*\\\\.alp"] = ".*\\\\."..path_pattern
    req["application/alp"] = "application/"..path_pattern
    end
    for n = 0, list.size() - 1 do
    local v = list.get(n)
    if req[v] then
    list.set(n, req[v])
   elseif user_permission then
    local p = v:match("%.permission%.([%w_]+)$")
    if p and (not user_permission[p]) then
    list.set(n, "android.permission.UNKNOWN")
    end
    end
    end

    local pt = activity.getLuaPath(".tmp")
    local fo = FileOutputStream(pt)
    xml.write(list, fo)
    local code = activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0).versionCode
    fo.close()
    local f = io.open(pt)
    local s = f:read("a")
    f:close()
    s = string.gsub(s, touint32(code), touint32(tointeger(ver_code) or 1),1)
    s = string.gsub(s, touint32(18), touint32(tointeger("15") or 18),1)

    local f = io.open(pt, "w")
    f:write(s)
    
    task(1500,function()
    bin_dlg.hide()
    LuaUtil.copyDir(activity.getLuaPath("tmp.apk"),"/sdcard/LuaJ/bin/"..app_name..".apk")
    import "apksigner.*"
    local tmp = activity.getLuaDir().."/tmp.apk"
    Sign.sign(tmp,"/sdcard/LuaJ/bin/"..app_name..".apk")
    activity.installApk("/sdcard/LuaJ/bin/"..app_name..".apk");
    print("打包完成")
    end)

    f:close()
    local fi = FileInputStream(pt)
    copy(fi,out)
    os.remove(pt)

   elseif not entry.isDirectory() then
    copy2(zis, out)
    end
    end

    entry = zis.getNextEntry()
    end
    out.setComment(table.concat(md5s))
    
    zis.close();
    out.closeEntry()
    out.close()




    end
    task(1000,function()
    binapk("/storage/emulated/0/LuaJ/Projects/"..标题.."/","/storage/emulated/0/LuaJ/bin/")
    end)
   elseif p==4 then
    function Sharing(path)
    import "android.webkit.MimeTypeMap"
    import "android.content.Intent"
    import "android.net.Uri"
    import "java.io.File"
    import "android.content.FileProvider"
    intent = Intent()
    intent.setAction(Intent.ACTION_SEND)
    intent.setType("*/*")
    uri=FileProvider.getUriForFile(activity,activity.getPackageName(),File(path));
    intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
    intent.putExtra(Intent.EXTRA_STREAM,uri)
    activity.startActivity(Intent.createChooser(intent, "分享到:"))
    end
    LuaUtil.zip(项目文件夹.."/"..标题,"/sdcard/LuaJ/backup/")
    os.execute("mv ".."/sdcard/LuaJ/backup/"..标题..".zip".." ".."/sdcard/LuaJ/backup/"..标题..".alp")
    Sharing("/sdcard/LuaJ/backup/"..标题..".alp")

   elseif p==3 then
    dialog1.dismiss()
    b=io.open(项目文件夹.."/"..标题.."/init.lua"):read("*a")
    if b:find("ver_code") then
    版本=b:match('ver_code="(.-)"')
   else
    版本="nil"
    end
    if b:find("package_name") then
    包名=b:match('package_name="(.-)"')
   else
    包名="nil"
    end
    if b:find("ver_name") then
    版本号=b:match('ver_name="(.-)"')
   else
    版本号="nil"
    end

    xq={
    CardView;
    radius=30;
    layout_width="match_parent";
    
    layout_height="match_parent";
    {
    CardView;
    layout_gravity="center";
    layout_height="280dp";
    layout_width="match_parent";
    backgroundColor=颜色1,
    radius=20;
    {
    TextView;
    text="文件详情";
    layout_marginTop="10dp";
    textSize="20sp";
    layout_marginLeft="25dp";
    textColor="0xFF03A9F4";
    };
    {
    ListView;
    id="文件详情";
    items={
    "";
    "名称："..标题;
    "包名："..包名;
    "版本："..版本;
    "版本号："..版本号;

    };
    layout_height="fill";
    backgroundColor="0xffffff";
    DividerHeight=0;
    layout_width="fill";
    };
    };
    };

    dialog= AlertDialog.Builder(this)
    dialog1=dialog.show()
    dialog1.getWindow().setContentView(loadlayout(xq));
    dialog1.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));
    local dialogWindow = dialog1.getWindow();
    dialogWindow.setGravity(Gravity.BOTTOM);
    dialog1.getWindow().getAttributes().width=(activity.Width);
    dialog1.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
    文件详情.onItemClick=function(l,v,p,i)
    if p==1 then
    写入剪切板(标题)
    print"已复制到剪切板"
   elseif p==2 then
    写入剪切板(包名)
    print"已复制到剪切板"
   elseif p==3 then
    写入剪切板(版本)
    print"已复制到剪切板"
   elseif p==4 then
    写入剪切板(版本号)
    print"已复制到剪切板"


    end
    end
    end
    end
    end