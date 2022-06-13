class ArticleInfo {
  final int action;
  final String type;
  //文章地址
  final String articleUrl;

  //图片地址
  final List<String> images;

  //文章标题
  final String title;

  //文章作者
  final String author;

  //作者描述
  final String description;

  //文章摘要
  final String summary;

  const ArticleInfo(this.action,this.type,this.articleUrl, this.images, this.title, this.summary,
      {this.author = 'xuexiang', this.description = 'Android架构师'});
}