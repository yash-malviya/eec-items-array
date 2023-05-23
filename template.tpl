___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Enhanced Ecommerce - Items Array",
  "categories": ["ANALYTICS"],
  "description": "This template will add/modify fields to the Enhanced Ecommerce items array.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "items",
    "displayName": "Items Array Variable (Datalayer)",
    "macrosInSelect": true,
    "selectItems": [],
    "simpleValueType": true,
    "alwaysInSummary": true,
    "help": "Add the variable which contains the value of items array from the dataLayer.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "SIMPLE_TABLE",
    "name": "keyValuePairs",
    "displayName": "Key-Value Pairs (Items Array)",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Key",
        "name": "key",
        "type": "TEXT",
        "valueHint": "item_brand",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "defaultValue": "",
        "displayName": "Value",
        "name": "value",
        "type": "TEXT",
        "valueHint": "e.g Google",
        "valueValidators": []
      }
    ],
    "alwaysInSummary": false,
    "help": "Refer the enhanced ecommerce guide to see the list of key value pairs that can be added to the dataLayer. If you wish to add or modify one of the key-value pair in the dataLayer, please add the required information below.",
    "newRowButtonText": "Add Parameters"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Get items array from dataLayer
let items = data.items;

// Traverse through each items in the array
items.forEach(function (item, index) {
  // Traverse through all the key-value pairs
  data.keyValuePairs.forEach(function (keyValuePair) {
    // Add or modify the key-valye pairs in the main variable
    items[index][keyValuePair.key] = keyValuePair.value;
  }); 
});

// Return variable value
return items;


___TESTS___

scenarios:
- name: Test 1
  code: |-
    const mockData = {
      items: [
        {
          item_id: "AIRX3AQUA",
          item_name: "Air Pro X3 Aqua",
          item_brand: "Air Pro",
          price: 2500,
          item_category: "Running Shoes",
          google_business_vertical: "retail",
          id: "AIRX3AQUA",
          quantity: "1",
        },
        {
          item_id: "AIRX3WHITE",
          item_name: "Air Pro X3 White",
          item_brand: "Air Pro",
          price: 3500,
          item_category: "Running Shoes",
          google_business_vertical: "retail",
          id: "AIRX3WHITE",
          quantity: "3",
        },
      ],
      keyValuePairs: [
        { key: "location_id", value: "ChIJE2XvSg2GQjkRPcLeB-ffO9E" },
        { key: "item_brand", value: "Google" },
        { key: "quanitity", value: "10" },
        { key: "item_category", value: "Jordans" },
      ],
    };

    // Call runCode to run the template's code.
    let variableResult = runCode(mockData);

    // Verify that the variable returns a result.
    assertThat(variableResult).isNotEqualTo(undefined);
setup: ''


___NOTES___

Created on 23/05/2023, 14:54:25


