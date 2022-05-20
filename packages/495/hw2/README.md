I have implement authorization and pagination. Not implemented the sorting bonus.

I couldn't find time to show all reviews on home page. Sorry.

There is an admin user in the system. This user can delete/create books and users. 

admin@gmail.com
12345678

Other users:
final1@gmail.com
12345678

final2@gmail.com
123456


final3@gmail.com
123456


final4@gmail.com
123456


final5@gmail.com
123456


finalauthor@gmail.com
123456

If 123456 dont work, it is probably 12345678 :D

Pretty printed documents below: 

A fiction book: 
{
  "_id": {
    "$oid": "6287f5b63155d455a3dbaa2e"
  },
  "isFiction": true,
  "Genre": "Romance",
  "coverImageUrl": "https://m.media-amazon.com/images/I/81PdOsc95OL.jpg",
  "name": "It Ends with Us",
  "author": "Colleen Hoover",
  "year": "2016",
  "_partition": "6283fd2ac3ac799e65415025",
  "ratings": {
    "6287f3423155d455a3db792d": {
      "$numberDouble": "2.75"
    },
    "6287fb453155d455a3dc0c78": {
      "$numberInt": "4"
    }
  },
  "readings": [
    "6287f3423155d455a3db792d",
    "6287fb453155d455a3dc0c78"
  ],
  "reviews": {
    "6287f3423155d455a3db792d": "review1"
  }
}

A non fiction book with multiple authors: 

{
  "_id": {
    "$oid": "6287f52994c80f7c64e7042f"
  },
  "isFiction": false,
  "Genre": "Mystery",
  "author": "Sara Alfageeh, Nadia Shammas",
  "name": "Squire",
  "coverImageUrl": "https://images-na.ssl-images-amazon.com/images/I/71s3PfszHYL.jpg",
  "year": "2022",
  "_partition": "6283fd2ac3ac799e65415025",
  "ratings": {
    "6287f3423155d455a3db792d": {
      "$numberDouble": "1.75"
    },
    "6287fb453155d455a3dc0c78": {
      "$numberDouble": "4.5"
    }
  },
  "readings": [
    "6287f3423155d455a3db792d",
    "6287fb453155d455a3dc0c78"
  ],
  "reviews": {
    "6287f3423155d455a3db792d": "not like it"
  }
}

A translated book: 

[
  {
    "_id": {
      "$oid": "6287f67a3155d455a3dbbbdc"
    },
    "isFiction": false,
    "Genre": "Mystery",
    "name": "Kan Ter ve Pikseller",
    "author": "Jason Schreier",
    "translator": "M. Ihsan Tatari",
    "publisher": "İthaki Yayınları",
    "year": "2021",
    "coverImageUrl": "https://img.kitapyurdu.com/v1/getImage/fn:11404538/wh:true/wi:800",
    "_partition": "6283fd2ac3ac799e65415025",
    "ratings": {
      "6287f3423155d455a3db792d": {
        "$numberInt": "4"
      },
      "6287fb453155d455a3dc0c78": {
        "$numberDouble": "3.75"
      }
    },
    "readings": [
      "6287f3423155d455a3db792d",
      "6287fb453155d455a3dc0c78"
    ],
    "reviews": {
      "6287f3423155d455a3db792d": "review2"
    }
  }
]

A book with and editor and multiple authors: 

[
  {
    "_id": {
      "$oid": "6287f75f94c80f7c64e72e75"
    },
    "isFiction": true,
    "Genre": "Mystery",
    "name": "Good Omens",
    "author": "Neil Gaiman, Terry Pratchett",
    "coverImageUrl": "https://images-na.ssl-images-amazon.com/images/I/51FuLRqRQwL._SX307_BO1,204,203,200_.jpg",
    "year": "1990",
    "editor": "Johnny Cage",
    "_partition": "6283fd2ac3ac799e65415025",
    "ratings": {
      "6287fb273155d455a3dc0aae": {
        "$numberDouble": "3.5"
      },
      "6287fb453155d455a3dc0c78": {
        "$numberDouble": "2.75"
      }
    },
    "readings": [
      "6287fb273155d455a3dc0aae",
      "6287fb453155d455a3dc0c78"
    ],
    "reviews": {
      "6287fb273155d455a3dc0aae": "best book ever"
    }
  }
]

A regular user: 

{
    "_id": {
      "$oid": "6287fb4f3155d455a3dc0d40"
    },
    "type": "normal",
    "custom_data": {},
    "data": {
      "email": "final6@gmail.com"
    },
    "identities": [
      {
        "id": "6287fb4f94c80f7c64e7729a",
        "provider_type": "local-userpass"
      }
    ],
    "userID": "6287fb4f3155d455a3dc0d3c",
    "eventLog": [
      {
        "created": {
          "$date": {
            "$numberLong": "1653078863726"
          }
        }
      }
    ]
  }

An author: 

{
  "_id": {
    "$oid": "6287fb5cd0df270d4c610ddc"
  },
  "type": "normal",
  "custom_data": {},
  "data": {
    "email": "finalauthor@gmail.com"
  },
  "identities": [
    {
      "id": "6287fb5ce7c15e155de864ae",
      "provider_type": "local-userpass"
    }
  ],
  "userID": "6287fb5cd0df270d4c610dd8",
  "eventLog": [
    {
      "created": {
        "$date": {
          "$numberLong": "1653078876559"
        }
      }
    }
  ],
  "isAuthor": true
}