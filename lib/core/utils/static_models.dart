import 'image_constant.dart';

class StaticBlogModel {
  String? image;
  String? title = "";
  String? description = "";
  String? date = "";
  String? reading_time = "";

  StaticBlogModel(
      {this.image, this.title, this.description, this.date, this.reading_time});
}

List<StaticBlogModel> list_blogs = [
  StaticBlogModel(
      image: ImageConstant.img_blog1,
      title: "Take a Scenic Train Ride",
      description:
          "The Swiss Alps are home to some of the world's most stunning train journeys, including the Glacier Express, which offers panoramic views of the mountains as it winds its way through the heart of the Alps",
      date: "22 Jan, 2023",
      reading_time: "1:30s"),
  StaticBlogModel(
      image: ImageConstant.img_blog2,
      title: "Hike the Alpine Trails",
      description:
          "With its well-marked trails and stunning mountain vistas, the Swiss Alps are a hiker's paradise. Whether you're looking for a leisurely stroll or a challenging ascent there's a trail for every level of hiker",
      date: "23 Jan, 2023",
      reading_time: "2:30s"),
  StaticBlogModel(
      image: ImageConstant.img_blog3,
      title: "Visit a Traditional Swiss Village",
      description:
          "Take a step back in time by visiting one of the many traditional Swiss villages scattered throughout the Alps. With their wooden chalets, charming gardens, and picturesque streets, these villages offer a glimpse into the traditional way of life in the Alps",
      date: "25 Jan, 2023",
      reading_time: "1:30s"),
  StaticBlogModel(
      image: ImageConstant.img_blog4,
      title: "Take a Dip in a Natural Hot Spring",
      description:
          "The Swiss Alps are home to a number of natural hot springs, perfect for soaking tired muscles after a day of hiking or skiing",
      date: "26 Jan, 2023",
      reading_time: "1:30s"),
  StaticBlogModel(
      image: ImageConstant.img_blog5,
      title: "Go Skiing or Snowboarding",
      description:
          "With its world-class ski resorts and challenging terrain, the Swiss Alps are a ski and snowboarder's paradise. Whether you're a beginner or an expert, there's a ski run for every level",
      date: "27 Jan, 2023",
      reading_time: "2:30s"),
  StaticBlogModel(
      image: ImageConstant.img_blog6,
      title: "Explore the Alpine Lakes",
      description:
          "From Lake Geneva to Lake Lucerne, the Swiss Alps are home to a number of stunning alpine lakes, each offering its own unique beauty and charm",
      date: "27 Jan, 2023",
      reading_time: "1:30s"),
  StaticBlogModel(
      image: ImageConstant.img_blog7,
      title: "Take a Scenic Drive",
      description:
          "With its winding roads and breathtaking views, the Swiss Alps offer some of the world's most stunning drives. Take a leisurely drive along the Great St. Bernard Pass or the Furka Pass for breathtaking views of the mountains",
      date: "28 Jan, 2023",
      reading_time: "1:30s"),
  StaticBlogModel(
      image: ImageConstant.img_blog8,
      title: "Visit a Cheese Factory",
      description:
          "The Swiss Alps are home to a number of traditional cheese factories, where you can learn about the art of cheese making and sample some of the region's famous cheeses.The Swiss Alps are a natural wonder that should be on every traveler’s bucket list. Whether you're looking for adventure or just a chance to escape and enjoy the beauty of nature, the Swiss Alps have something for everyone",
      date: "28 Jan, 2023",
      reading_time: "1:30s"),
];
