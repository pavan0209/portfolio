'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"main.dart.js": "3ba55aa92dcb32c90e51137a328de872",
"assets/AssetManifest.json": "6ec66b29a0bee371ee9bb38ba50aa0f5",
"assets/assets/images/skills/mysql.png": "d4e1fce10dc9d0c2e5d36e98fcb7db86",
"assets/assets/images/skills/dart.png": "d23d1b105f148118bd52f010ebbd1be2",
"assets/assets/images/skills/html.png": "316f22a202ff8be6dba7d1c679a2c8e3",
"assets/assets/images/skills/c_language.png": "b9e04851b3b3e703127330526e7957c6",
"assets/assets/images/skills/java.png": "1b5ed6792c333a363f9d9d848a6aeb5c",
"assets/assets/images/skills/figma.png": "f7d5fd006ce2eeec6d403c1e9b00f2fb",
"assets/assets/images/skills/flutter.png": "a55e1591225bc51d4e5d89d7885304fa",
"assets/assets/images/skills/css.png": "f671b9931894ea8ab5e23306ecffc9d9",
"assets/assets/images/skills/python.png": "8d494e826d8f767016994b6d13ed4a27",
"assets/assets/images/expense_manager/home.png": "cf631529972210141a183d836bc867fc",
"assets/assets/images/expense_manager/graph_category.png": "ee03c01be4562928f4b19fefc14cde0d",
"assets/assets/images/expense_manager/transactions_drawer.png": "699898d15d53cf40cb987fcd6522ce06",
"assets/assets/images/social/facebook.png": "f5b3955e1b8f5c49cf72b56a486005d7",
"assets/assets/images/social/whatsapp.png": "444729e48e401ff099868311618f5b61",
"assets/assets/images/social/telegram.png": "1b60256bce42ac38944061d8d39ee6a9",
"assets/assets/images/social/instagram.png": "6795d7d348ff3ff691221099ced0d535",
"assets/assets/images/social/snapchat.png": "4435736f7399ce19d8dbbf5ab5fc1e43",
"assets/assets/images/pavan.png": "9401db09d01f48c785924416c96a20ed",
"assets/assets/images/portfolio_project/projects.png": "e71c0b109dcba66776e6efb8ae5df5ed",
"assets/assets/images/portfolio_project/mobile.png": "fa516f1085cd80d7b162a8e7e26dc940",
"assets/assets/images/portfolio_project/mobile_contact.png": "f99e1010fece3d98f4bd1d2048b3c517",
"assets/assets/images/portfolio_project/home.png": "60ece0c278c73f014dda86914cede464",
"assets/assets/images/portfolio_project/contact.png": "c4bc7f3725c783ad0136268bd9ca6374",
"assets/assets/images/portfolio_project/about.png": "1c569d537152e2d875cbd6c02a778db2",
"assets/assets/images/farmers_mart/details.png": "d177c243ca45744e1231071c1d5044d3",
"assets/assets/images/farmers_mart/home.png": "4df378cded145386487129737d2dd88e",
"assets/assets/images/farmers_mart/login.png": "12fe93f01de463b6b01e8ad84e5c1b57",
"assets/assets/images/farmers_mart/account.png": "6256ad4cae344bc1ef549812f34c725c",
"assets/assets/images/bikers_hub/delete_bike.png": "ffdb1b36e8959621f0e9051f1f30e4ba",
"assets/assets/images/bikers_hub/view_bike.png": "8d60d4662d4db4cd73f211a3431b260d",
"assets/assets/images/bikers_hub/home.png": "c4ef388047ea96b28971fab0fee67698",
"assets/assets/images/bikers_hub/add_bike.png": "e879aabe1bbe46ba75624ad17c92f297",
"assets/assets/images/bikers_hub/about.png": "a65285425799de5a4c4b70b51ae183e7",
"assets/assets/images/app_logo.png": "127603d3c02c46b0e05c6b56f870eb63",
"assets/assets/images/newsflash/login_reset.png": "f67bd076351c82f073d96633be8e1aba",
"assets/assets/images/newsflash/home.png": "cb2113322fbbf1523b74cd77865810bc",
"assets/assets/images/newsflash/guest_about.png": "d4bb48775ad10213e31e9eecb3bac482",
"assets/assets/images/user_avatar_mac.png": "1886a935ed8500281a95d388143b2634",
"assets/assets/images/platforms/gfg.png": "f9c138594985c68b1aa2f5cada1cda18",
"assets/assets/images/platforms/gitlab.png": "f4fc8b673432b843ca9ad1293c59a095",
"assets/assets/images/platforms/leetcode.png": "b2e40475d2ef3a9e629c35cc6d83467d",
"assets/assets/images/platforms/linkedin.png": "140a431f567c4a7607b54946bc70cf82",
"assets/assets/images/platforms/github.png": "e6d4308def89ed20cc34218c049ba0e9",
"assets/assets/fonts/Poppins-SemiBold.ttf": "6f1520d107205975713ba09df778f93f",
"assets/assets/fonts/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/assets/fonts/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/AssetManifest.bin.json": "b51d393a5634328e5189b9f5b6b7fdbb",
"assets/NOTICES": "31d634530a6ab1b953716f8a7d55a744",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/FontManifest.json": "ccdbee8e1a9b03e897da7561189b7c48",
"assets/fonts/MaterialIcons-Regular.otf": "a705336754441687a8beb22d8e98b55d",
"assets/AssetManifest.bin": "8431a1b42fb8fe99979f8f6f5ef21254",
"version.json": "0325640b78b9f97959290dc5ebb8b3ed",
"index.html": "c1c5f29031926111ab3ccb7c551c88f9",
"/": "c1c5f29031926111ab3ccb7c551c88f9",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"manifest.json": "3c00bfb5fa6c03e5efff656e896ed43c",
"favicon.png": "c1e0e2cf88d2ea96bd560ffa8dbd6ead",
"flutter_bootstrap.js": "ae7a29d1a9f9a7c25a1a7c7fa9bc708b",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"icons/Icon-maskable-512.png": "1dcdd82bee90aa783fd79ed46de62468",
"icons/Icon-maskable-192.png": "09c91703196b10faf57eb10aaf2b569f",
"icons/Icon-512.png": "1dcdd82bee90aa783fd79ed46de62468",
"icons/Icon-192.png": "09c91703196b10faf57eb10aaf2b569f"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
