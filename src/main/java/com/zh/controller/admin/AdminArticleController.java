package com.zh.controller.admin;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zh.pojo.Article;
import com.zh.pojo.Classify;
import com.zh.pojo.Tag;
import com.zh.pojo.UserBase;
import com.zh.service.ArticleService;
import com.zh.service.ClassifyService;
import com.zh.service.TagService;
import com.zh.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

@Controller
@RequestMapping("/admin/article")
public class AdminArticleController {

    @Autowired
    private UUIDUtils uuidUtils;
    @Autowired
    private ArticleService articleService;
    @Autowired
    private ClassifyService classifyService;
    @Autowired
    private TagService tagService;

    @GetMapping("/lookArticle/{aid}")
    public String lookArticle(@PathVariable("aid") Integer aid,Model model){

        Article article = articleService.findById(aid);

        model.addAttribute("article",article);

        return "reception/article_details";
    }

    @RequestMapping("/updateArticle")
    @ResponseBody
    public String updateArticle(Article article, HttpSession session){
        UserBase user = (UserBase) session.getAttribute("user");
        article.setUserBase(user);
        int i = articleService.updateArticle(article);
        System.out.println("进入修改article:====="+article);
        System.out.println("=========="+i);
        if (i>0){
            return "true";
        }else {
            return "false";
        }

    }

    @RequestMapping("/gotoArticleEdit")
    public String gotoArticleEdit(Model model){

        List<Classify> cList = classifyService.findAll();
        List<Tag> tList = tagService.findAll();

        model.addAttribute("cList",cList);
        model.addAttribute("tList",tList);

        return "admin/article_edit";
    }

    @GetMapping("/updateArticle/{aid}")
    public String updateArticle(@PathVariable("aid") Integer aid,Model model){

        Article article = articleService.findById(aid);
        List<Classify> cList = classifyService.findAll();
        List<Tag> tList = tagService.findAll();

        model.addAttribute("cList",cList);
        model.addAttribute("tList",tList);
        model.addAttribute("article",article);

        return "admin/article_edit";
    }

    @PostMapping("/fuzzyQuery")
    @ResponseBody
    public PageInfo fuzzyQuery(Integer pageNum,String tag){
        PageHelper.startPage(pageNum, 10);
        List<Article> list = articleService.fuzzyQuery(tag);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @PostMapping("/deleteArticle")
    @ResponseBody
    public String deleteArticle(int aid){

        int i = articleService.deleteArticle(aid);

        if (i > 0){
            return "true";
        }else {
            return "false";
        }
    }


    @RequestMapping("/gotoArticleManage")
    public String gotoArticleManage(){
        return "admin/article_manage";
    }

    /**
     * state 状态
     * pageNum 前页码，从1开始
     * pageSize 每页数据
     * @return
     */
    @GetMapping("/gotoArticleManage/{state}/{pageNum}")
    @ResponseBody
    public JSONObject gotoArticleManage(
            @PathVariable("state") Integer state,
            @PathVariable("pageNum") Integer pageNum){

        PageHelper.startPage(pageNum, 10);
        List<Article> list = articleService.findByState(state);
        //如果直接返回list，得到了分页的数据，如果添加下面步骤，返回pageInfo，则能得到包括list在内的分页信息
        PageInfo pageInfo = new PageInfo(list);
        JSONObject json = new JSONObject();
        json.put("state",state);
        json.put("info",pageInfo);

        return json;
    }


    @RequestMapping("/addArticle")
    @ResponseBody
    public String addArticle(Article article, HttpSession session){
        UserBase user = (UserBase) session.getAttribute("user");
        article.setUserBase(user);
        System.out.println("进入添加文章");
        System.out.println(article);
        int i = articleService.addArticle(article);
        if (i>0){
            return "true";
        }else {
            return "false";
        }

    }


    @RequestMapping("/uploadImage")
    @ResponseBody
    public JSONObject uploadImage(
            @RequestParam(value = "editormd-image-file", required = true) MultipartFile file,
            HttpServletRequest request) throws IOException {

        //系统文件分隔符
        String sepa = File.separator;

        //获得SpringBoot当前项目的路径：System.getProperty("user.dir")
        String path = System.getProperty("user.dir")+sepa+"upload"+sepa;

        //分隔符File.separator

        //按照日期进行分类：
        Calendar instance = Calendar.getInstance();
        String year = (instance.get(Calendar.YEAR)) + sepa;
        String month = "0"+(instance.get(Calendar.MONTH) + 1) + sepa;
        path = path+year+month;


        File realPath = new File(path);
        if (!realPath.exists()){ //测试此抽象路径名表示的文件或目录是否存在。
            realPath.mkdirs();    //创建此抽象路径名指定的目录。
        }

        //上传文件地址
        System.out.println("上传文件保存地址："+realPath);


        //解决文件名字问题：使用uuid;
        //获取文件后缀
        int begin  = file.getOriginalFilename().indexOf(".");
        int end = file.getOriginalFilename().length();
        String suffix = file.getOriginalFilename().substring(begin, end);

        String filename = uuidUtils.getUUID()+suffix;
        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
        file.transferTo(new File(realPath + sepa + filename));

        System.out.println(sepa + "upload" + sepa +year+month+ filename);
        //给editormd进行回调
        JSONObject json = new JSONObject();
        json.put("url",sepa + "upload"+ sepa +year+month+ filename);
        json.put("success", 1);
        json.put("message", "upload success!");

        return json;
    }

}
