import 'package:anbyshop/util/colors.dart';
import 'package:anbyshop/widgets/productCard/productHorizontalCard.dart';
import 'package:anbyshop/widgets/productCard/productVerticalCard.dart';
import 'package:flutter/material.dart';

class ShopSearch extends SearchDelegate<String> {
  final productList = [
    {
      "tax": [],
      "productExtraInfo": [],
      "reviews": [],
      "images": [
        {
          "bucketName": "softimpression",
          "url":
              "https://static.soft-impressions.com/softimpression/product/489.5035997565289-media.webp"
        }
      ],
      "_id": "5fb23c988694a378c6e804d6",
      "variants": [
        {
          "images": [],
          "id": "qeUosUdWSX740kvDzTAF",
          "sellingPrice": 40.8,
          "stock": {"totalQty": 100},
          "type": "Size",
          "value": "30 Pcs",
          "price": 50
        }
      ],
      "discount": 18.4,
      "productDealer": "Neeraj dana",
      "productDetailSubCategory": "",
      "productClassification":
          "<p>Home Made Clay Mitti Diya Deepak, Cotton Wicks Baati Set of 30 Pieces</p>",
      "productCategory": "Hand made",
      "productSubCategory": "Diya",
      "productExtraInfoExits": false,
      "productBrand": "ND",
      "productName":
          "Home Made Clay Mitti Diya Deepak, Cotton Wicks Baati Set of 30 Pieces"
    },
    {
      "tax": [],
      "productExtraInfo": [],
      "reviews": [],
      "images": [
        {
          "bucketName": "softimpression",
          "url":
              "https://static.soft-impressions.com/softimpression/product/7614.395712955542-media.webp"
        },
        {
          "bucketName": "softimpression",
          "url":
              "https://static.soft-impressions.com/softimpression/product/9462.488604294334-media.webp"
        }
      ],
      "_id": "5fb25efaa540646e96e9bdf8",
      "variants": [
        {
          "sellingPrice": 48.96,
          "stock": {"totalQty": 100},
          "price": 60,
          "images": [],
          "id": "UArnkwb5M1phEMdgQtep",
          "value": "100 GM",
          "type": "Size"
        }
      ],
      "productSubCategory": "Masala",
      "productExtraInfoExits": false,
      "productName": "Everest Pani Puri Masala",
      "productDetailSubCategory": "",
      "productBrand": "Everest",
      "productClassification":
          "<ul><li>A perfect blend of pure spices</li><li>Enhances the taste of your dish</li><li>A perfect blend of pure spices</li></ul>",
      "productCategory": "Spices",
      "discount": 18.4,
      "productDealer": "Shital Prasad Mukandi Lal Jain"
    },
    {
      "tax": [],
      "productExtraInfo": [],
      "reviews": [],
      "images": [
        {
          "bucketName": "softimpression",
          "url":
              "https://static.soft-impressions.com/softimpression/product/7658.44516077312-media.jpg"
        }
      ],
      "_id": "5fb25efaa540646e96e9bdf9",
      "variants": [
        {
          "price": 65,
          "value": "100 GM",
          "images": [],
          "type": "Size",
          "stock": {"totalQty": 100},
          "sellingPrice": 53.04,
          "id": "3VWGOzXNJetaMZ1Cm6bo"
        }
      ],
      "productClassification":
          "<p>Everest&nbsp;· Powder&nbsp;· Dried&nbsp;· Blend&nbsp;· All Purpose Seasoning</p><p>Indian curries are all about imbibing a variety of spices with meat, dal, or vegetables for a rich flavor and lots of texture. The spices in Indian cuisine can make or break the dish. Everest understands this and has been busy making spices and spice mixes that can lift any and every dish in Indian cooking. The Everest Kitchen King Masala is a perfect example of this.</p><ul><li>Being turmeric and coriander based, the mix gives curry a tasty golden hue</li><li>Ideal for vegetable dishes with soft curry</li><li>Country of Origin: India</li></ul>",
      "productCategory": "Spices",
      "productName": "Everest Kitchen King Masala",
      "discount": 18.4,
      "productDealer": "Shital Prasad Mukandi Lal Jain",
      "productBrand": "Everest",
      "productExtraInfoExits": false,
      "productSubCategory": "Masala",
      "productDetailSubCategory": ""
    },
    {
      "tax": [],
      "productExtraInfo": [],
      "reviews": [],
      "images": [
        {
          "url":
              "https://static.soft-impressions.com/softimpression/product/9069.096556843908-media.jpg",
          "bucketName": "softimpression"
        }
      ],
      "_id": "5fb25efaa540646e96e9bdfa",
      "variants": [
        {
          "images": [],
          "stock": {"totalQty": 100},
          "type": "Size",
          "value": "130 GM",
          "id": "GrXU44CRDhfNcjp1SP0N",
          "price": 10,
          "sellingPrice": 9.49
        }
      ],
      "productName": "Parle Magix Chocolate Sandwich Biscuits",
      "productSubCategory": "Biscuit",
      "productDealer": "Shital Prasad Mukandi Lal Jain",
      "productClassification":
          "<ul><li>Combination of taste and health</li></ul>",
      "productBrand": "Parle",
      "productCategory": "Biscuit",
      "productExtraInfoExits": false,
      "discount": 5.1,
      "productDetailSubCategory": ""
    },
    {
      "tax": [],
      "productExtraInfo": [],
      "reviews": [],
      "images": [
        {
          "url":
              "https://static.soft-impressions.com/softimpression/product/5712.965353674231-media.webp",
          "bucketName": "softimpression"
        }
      ],
      "_id": "5fb25efaa540646e96e9bdfb",
      "variants": [
        {
          "sellingPrice": 47.66,
          "images": [],
          "value": "150 GM",
          "price": 50,
          "type": "Size",
          "stock": {"totalQty": 100},
          "id": "ThkS3XYxdpRjWQRI3SEv"
        }
      ],
      "productSubCategory": "Namkeen",
      "productExtraInfoExits": false,
      "productName": "Haldirams - Indian Snack  Bhel Puri",
      "productDealer": "Shital Prasad Mukandi Lal Jain",
      "productCategory": "Namkeen",
      "productBrand": "Haldiram",
      "discount": 4.68,
      "productClassification":
          "<p>Haldiram Bhel Puri children love this snack because this has a lovely flavor and this can be eaten with food as a side dish. This makes the food more appetizing and also highly spiced. It is a kind of stuffed rice. And it is high-quality for health.</p>",
      "productDetailSubCategory": ""
    },
    {
      "tax": [],
      "productExtraInfo": [],
      "reviews": [],
      "images": [
        {
          "url":
              "https://static.soft-impressions.com/softimpression/product/8503.537508553407-media.jpeg",
          "bucketName": "softimpression"
        },
        {
          "bucketName": "softimpression",
          "url":
              "https://static.soft-impressions.com/softimpression/product/3369.3974960991136-media.jpeg"
        }
      ],
      "_id": "5fb25efaa540646e96e9bdfc",
      "variants": [
        {
          "images": [],
          "stock": {"totalQty": 100},
          "sellingPrice": 128.52,
          "price": 140,
          "value": "250 GM",
          "id": "LqLIJYAcltZZ2UO5TsIJ",
          "type": "Size"
        }
      ],
      "productDetailSubCategory": "",
      "discount": 8.2,
      "productCategory": "Sweets",
      "productName": "Meetha Ghewar",
      "productExtraInfoExits": false,
      "productDealer": "Shree Bansal Sweets",
      "productSubCategory": "Ghewar",
      "productClassification":
          "<p>Some mouth-watering Gheewar can uplift anyone's mood in seconds. This Rajasthani delicacy is filled with enticing flavors. Topped with Dry Fruits' crumbs, you can taste the crunch in every bite. The perfect texture of the Ghewar will leave you drooling.</p><h4>DISCLAIMER :</h4><ul><li>The delivered product might vary slightly from the image shown.</li><li>The date of delivery is provisional as it is shipped through third party courier partners.</li><li>We try to get the gift delivered close to the provided date. However, your gift may be delivered prior to or after the selected date of delivery.</li><li>To maintain the element of surprise on gift arrival, our courier partners do not call prior to delivering an order, so we request that you provide an address at which someone will be present to receive the package.</li><li>Delivery may not be possible on Sundays and National Holidays.</li><li>For international deliveries, custom charges might be levied which are payable by the recipient.</li></ul>",
      "productBrand": "Shree Bansal Sweets"
    },
    {
      "tax": [],
      "productExtraInfo": [],
      "reviews": [],
      "images": [
        {
          "url":
              "https://static.soft-impressions.com/softimpression/product/4312.336096354336-media.jpg",
          "bucketName": "softimpression"
        },
        {
          "url":
              "https://static.soft-impressions.com/softimpression/product/4991.966569949415-media.jpg",
          "bucketName": "softimpression"
        }
      ],
      "_id": "5fb25efaa540646e96e9bdfe",
      "variants": [
        {
          "images": [],
          "stock": {"totalQty": 100},
          "value": "500 GM",
          "id": "ueTkA7CSWXZ7de7wBXLk",
          "sellingPrice": 159.12,
          "price": 195,
          "type": "Size"
        }
      ],
      "productExtraInfoExits": false,
      "productName": "Everest Tikhalal Hot & Red Chilli Powder Extra Hot Jar",
      "productDetailSubCategory": "",
      "productClassification":
          "<p><br><strong>Container Type</strong>:- Jar.<br><br><strong>Product Type</strong>:- Chilli Powder<br><br>This is a <strong>VEGETARIAN</strong> product.<br><br>Add a dash of flavor and hotness to your home-cooked food with Everest Tikhalal Hot &amp; Red Chilli Powder Extra Hot. It is a great blend of pungency and colour.<br><br><strong>Ingredients:- Chilli</strong><br>Chilli powder in this package contains an admixture of not more than 2% edible oil.</p>",
      "productBrand": "Everest",
      "productCategory": "Spices",
      "productDealer": "Shital Prasad Mukandi Lal Jain",
      "productSubCategory": "Red Chilli Powder",
      "discount": 18.4
    },
    {
      "tax": [],
      "productExtraInfo": [],
      "reviews": [],
      "images": [
        {
          "bucketName": "softimpression",
          "url":
              "https://static.soft-impressions.com/softimpression/product/7023.676145740609-media.webp"
        }
      ],
      "_id": "5fb25efaa540646e96e9bdff",
      "variants": [
        {
          "stock": {"totalQty": 100},
          "id": "PQvRRuOhAq6oBn9AWVqF",
          "price": 165,
          "images": [],
          "sellingPrice": 152.99,
          "value": "340 ml",
          "type": "Size"
        }
      ],
      "productSubCategory": "Shampoo",
      "productDetailSubCategory": "",
      "productBrand": "Sunsilk",
      "discount": 7.28,
      "productCategory": "Grooming",
      "productName": "Sunsilk Nourishing Soft & Smooth Shampoo",
      "productClassification":
          "<p>Say Goodbye To The Harsh And Dry Hair With The Sunsilk Nourishing Soft &amp; Smooth Shampoo. The Exclusive Formula, Co-created By Thomas Taw, A Dry And Damage Expert From London, Leaves Your Hair Looking Gorgeous. Unique Blend It Comes With Five Natural Oils That Nourish Your Hair Deeply, Without Making It Greasy Or Limp.</p>",
      "productDealer": "Shital Prasad Mukandi Lal Jain",
      "productExtraInfoExits": false
    },
    {
      "tax": [],
      "productExtraInfo": [],
      "reviews": [],
      "images": [
        {
          "bucketName": "softimpression",
          "url":
              "https://static.soft-impressions.com/softimpression/product/8034.435704754328-media.jpeg"
        },
        {
          "bucketName": "softimpression",
          "url":
              "https://static.soft-impressions.com/softimpression/product/5684.0440304435115-media.jpg"
        }
      ],
      "_id": "5fb25efaa540646e96e9be00",
      "variants": [
        {
          "value": "1 FT",
          "type": "Size",
          "price": 215,
          "id": "XdxbmFkAoxWEoTDH0yI4",
          "stock": {"totalQty": 100},
          "images": [],
          "sellingPrice": 215
        }
      ],
      "productExtraInfoExits": false,
      "productSubCategory": "Plant",
      "productCategory": "Plants",
      "discount": 0,
      "productBrand": "Indra farm and nursery",
      "productDetailSubCategory": "",
      "productName": "Phoenix Indoor Plant",
      "productDealer": "Indra farm and nursery",
      "productClassification":
          "<p>Phoenix Indoor Plant Just for showcase in our house to make it natural and make your house seems to have good vibes in others eyes.</p>"
    },
    {
      "tax": [],
      "productExtraInfo": [],
      "reviews": [],
      "images": [
        {
          "bucketName": "softimpression",
          "url":
              "https://static.soft-impressions.com/softimpression/product/41.857591131833075-media.jpeg"
        },
        {
          "bucketName": "softimpression",
          "url":
              "https://static.soft-impressions.com/softimpression/product/5488.066626683554-media.jpg"
        }
      ],
      "_id": "5fb25efaa540646e96e9be01",
      "variants": [
        {
          "stock": {"totalQty": 100},
          "sellingPrice": 44,
          "type": "Size",
          "images": [],
          "price": 44,
          "id": "2x8cidWTBpS0ATrS5ABN",
          "value": "1 FT"
        }
      ],
      "productSubCategory": "Plant",
      "discount": 0,
      "productName": "Pan Money Plant (Pan ki bel)",
      "productBrand": "Kedar Farm",
      "productDealer": "Indra farm and nursery",
      "productCategory": "Plants",
      "productExtraInfoExits": false,
      "productClassification":
          "<h4>Plant Essentials</h4><p><strong>Fertilizer/ feed for the plant: </strong>Feed the Betel Leaf plants every 2 months with organic-rich fertilizer.<br><strong>Repotting: </strong>Repot the beetle leaf only if the plant is out of any space to grow. Even then, don’t choose a very large pot to replant because that could damage the plant.<br><strong>Propogation: </strong>Betel Leaf plants can be propagated via stem cuttings. Choose a stem that is longer than 18 cm for propagation.</p><p>&nbsp;</p><h4>Style and Decor</h4><p><strong>Light Requirements: </strong>Betel leaf plants require partial shade and humidity.<br><strong>Locations: </strong>Balconies or windowsills where there is a shade for your betel leaf plant are the best locations.<br><strong>Styling/decor tip: </strong>Add a modular hexagonal wall hanging for the Betel Leaf plant to grow on, thus creating a beautiful pattern with the plant while keeping it from climbing directly on your interior walls. Let the plant climb on a moss stick to add height to your space. The beetle leaf looks great in corners or on trellises.</p>",
      "productDetailSubCategory": ""
    }
  ];

  final recentProduct = [
    {
      "tax": [],
      "productExtraInfo": [],
      "reviews": [],
      "images": [
        {
          "bucketName": "softimpression",
          "url":
              "https://static.soft-impressions.com/softimpression/product/489.5035997565289-media.webp"
        }
      ],
      "_id": "5fb23c988694a378c6e804d6",
      "variants": [
        {
          "images": [],
          "id": "qeUosUdWSX740kvDzTAF",
          "sellingPrice": 40.8,
          "stock": {"totalQty": 100},
          "type": "Size",
          "value": "30 Pcs",
          "price": 50
        }
      ],
      "discount": 18.4,
      "productDealer": "Neeraj dana",
      "productDetailSubCategory": "",
      "productClassification":
          "<p>Home Made Clay Mitti Diya Deepak, Cotton Wicks Baati Set of 30 Pieces</p>",
      "productCategory": "Hand made",
      "productSubCategory": "Diya",
      "productExtraInfoExits": false,
      "productBrand": "ND",
      "productName":
          "Home Made Clay Mitti Diya Deepak, Cotton Wicks Baati Set of 30 Pieces"
    },
    {
      "tax": [],
      "productExtraInfo": [],
      "reviews": [],
      "images": [
        {
          "bucketName": "softimpression",
          "url":
              "https://static.soft-impressions.com/softimpression/product/7614.395712955542-media.webp"
        },
        {
          "bucketName": "softimpression",
          "url":
              "https://static.soft-impressions.com/softimpression/product/9462.488604294334-media.webp"
        }
      ],
      "_id": "5fb25efaa540646e96e9bdf8",
      "variants": [
        {
          "sellingPrice": 48.96,
          "stock": {"totalQty": 100},
          "price": 60,
          "images": [],
          "id": "UArnkwb5M1phEMdgQtep",
          "value": "100 GM",
          "type": "Size"
        }
      ],
      "productSubCategory": "Masala",
      "productExtraInfoExits": false,
      "productName": "Everest Pani Puri Masala",
      "productDetailSubCategory": "",
      "productBrand": "Everest",
      "productClassification":
          "<ul><li>A perfect blend of pure spices</li><li>Enhances the taste of your dish</li><li>A perfect blend of pure spices</li></ul>",
      "productCategory": "Spices",
      "discount": 18.4,
      "productDealer": "Shital Prasad Mukandi Lal Jain"
    },
    {
      "tax": [],
      "productExtraInfo": [],
      "reviews": [],
      "images": [
        {
          "bucketName": "softimpression",
          "url":
              "https://static.soft-impressions.com/softimpression/product/7658.44516077312-media.jpg"
        }
      ],
      "_id": "5fb25efaa540646e96e9bdf9",
      "variants": [
        {
          "price": 65,
          "value": "100 GM",
          "images": [],
          "type": "Size",
          "stock": {"totalQty": 100},
          "sellingPrice": 53.04,
          "id": "3VWGOzXNJetaMZ1Cm6bo"
        }
      ],
      "productClassification":
          "<p>Everest&nbsp;· Powder&nbsp;· Dried&nbsp;· Blend&nbsp;· All Purpose Seasoning</p><p>Indian curries are all about imbibing a variety of spices with meat, dal, or vegetables for a rich flavor and lots of texture. The spices in Indian cuisine can make or break the dish. Everest understands this and has been busy making spices and spice mixes that can lift any and every dish in Indian cooking. The Everest Kitchen King Masala is a perfect example of this.</p><ul><li>Being turmeric and coriander based, the mix gives curry a tasty golden hue</li><li>Ideal for vegetable dishes with soft curry</li><li>Country of Origin: India</li></ul>",
      "productCategory": "Spices",
      "productName": "Everest Kitchen King Masala",
      "discount": 18.4,
      "productDealer": "Shital Prasad Mukandi Lal Jain",
      "productBrand": "Everest",
      "productExtraInfoExits": false,
      "productSubCategory": "Masala",
      "productDetailSubCategory": ""
    },
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {})];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {}

  @override
  Widget buildSuggestions(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
