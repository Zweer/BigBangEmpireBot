package com.playata.framework.display
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.assets.AssetType;
   import com.playata.framework.assets.Assets;
   import com.playata.framework.assets.IAssetLoader;
   import com.playata.framework.assets.StringDefinitionAsset;
   import com.playata.framework.assets.definition.AssetDefinition;
   import com.playata.framework.assets.definition.StringAssetDefinitionData;
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.BitmapData;
   import spine.Event;
   import spine.Skeleton;
   import spine.SkeletonData;
   import spine.SkeletonJson;
   import spine.animation.AnimationState;
   import spine.animation.AnimationStateData;
   import spine.atlas.Atlas;
   import spine.attachments.AtlasAttachmentLoader;
   import spine.flash.FlashTextureLoader;
   import spine.flash.SkeletonAnimation;
   
   public class AsyncSpineDisplayObject extends DisplayObject implements ISpineDisplayObject
   {
      
      private static var CALLBACKS:StringMap = new StringMap();
      
      private static var STRING_DATAS:StringMap = new StringMap();
      
      private static var BITMAP_DATAS:StringMap = new StringMap();
      
      private static var SKELETON_DATAS:StringMap = new StringMap();
       
      
      private var _identifier:String = null;
      
      private var _atlasURL:String = null;
      
      private var _textureURL:String = null;
      
      private var _jsonURL:String = null;
      
      private var _atlas:String = null;
      
      private var _texture:BitmapData = null;
      
      private var _json:String = null;
      
      private var _skeleton:SkeletonAnimation = null;
      
      private var _content:Sprite = null;
      
      private var _loaded:Boolean = false;
      
      private var _spineDisplayObject:FlashSprite = null;
      
      public function AsyncSpineDisplayObject(param1:String)
      {
         _content = new Sprite();
         super(_content);
         _identifier = param1;
         _atlasURL = param1 + ".atlas";
         _textureURL = param1 + ".png";
         _jsonURL = param1 + ".json";
         loadJson();
      }
      
      private static function getString(param1:String, param2:Function) : void
      {
         stringURL = param1;
         callback = param2;
         if(STRING_DATAS.exists(stringURL))
         {
            §§push(callback(STRING_DATAS.getData(stringURL) as String));
            return;
         }
         if(CALLBACKS.exists(stringURL))
         {
            (CALLBACKS.getData(stringURL) as Vector.<Function>).push(callback);
            return;
         }
         CALLBACKS.setData(stringURL,new Vector.<Function>());
         (CALLBACKS.getData(stringURL) as Vector.<Function>).push(callback);
         var stringLoader:IAssetLoader = Environment.assetManager.getLoader(AssetType.STRING);
         stringLoader.enqueue(new AssetDefinition(stringURL,new StringAssetDefinitionData()));
         stringLoader.load(null,function():void
         {
            var _loc3_:* = null;
            var _loc1_:* = undefined;
            var _loc2_:int = 0;
            if(stringLoader.getAsset(stringURL))
            {
               _loc3_ = (stringLoader.getAsset(stringURL) as StringDefinitionAsset).string;
               STRING_DATAS.setData(stringURL,_loc3_);
               _loc1_ = CALLBACKS.getData(stringURL) as Vector.<Function>;
               _loc2_ = 0;
               while(_loc2_ < _loc1_.length)
               {
                  _loc1_[_loc2_](_loc3_);
                  _loc2_++;
               }
               CALLBACKS.remove(stringURL);
            }
         });
      }
      
      private static function getBitmapData(param1:String, param2:String, param3:Function) : void
      {
         textureURL = param1;
         atlas = param2;
         callback = param3;
         if(BITMAP_DATAS.exists(textureURL))
         {
            §§push(callback(BITMAP_DATAS.getData(textureURL) as BitmapData));
            return;
         }
         if(CALLBACKS.exists(textureURL))
         {
            (CALLBACKS.getData(textureURL) as Vector.<Function>).push(callback);
            return;
         }
         CALLBACKS.setData(textureURL,new Vector.<Function>());
         (CALLBACKS.getData(textureURL) as Vector.<Function>).push(callback);
         var s:int = atlas.indexOf("size: ") + 6;
         var e:int = atlas.indexOf("\n",s) - s;
         var sizeString:String = atlas.substr(s,e);
         var size:Array = sizeString.split(",");
         var width:int = parseInt(size[0]);
         var height:int = parseInt(size[1]);
         UriSprite.load(Assets.assetURL(textureURL),width,height,false,2,function(param1:IUriSprite):void
         {
            var _loc4_:int = 0;
            var _loc2_:BitmapData = param1.bitmapData;
            BITMAP_DATAS.setData(textureURL,_loc2_);
            var _loc3_:Vector.<Function> = CALLBACKS.getData(textureURL) as Vector.<Function>;
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               _loc3_[_loc4_](_loc2_);
               _loc4_++;
            }
            CALLBACKS.remove(textureURL);
         });
      }
      
      private static function getSpineData(param1:String, param2:String, param3:BitmapData, param4:String, param5:Function) : void
      {
         var _loc11_:int = 0;
         if(SKELETON_DATAS.exists(param1))
         {
            §§push(param5(SKELETON_DATAS.getData(param1) as SkeletonData));
            return;
         }
         if(CALLBACKS.exists(param1))
         {
            (CALLBACKS.getData(param1) as Vector.<Function>).push(param5);
            return;
         }
         CALLBACKS.setData(param1,new Vector.<Function>());
         (CALLBACKS.getData(param1) as Vector.<Function>).push(param5);
         var _loc7_:Atlas = new Atlas(param2,new FlashTextureLoader(param3));
         var _loc6_:AtlasAttachmentLoader = new AtlasAttachmentLoader(_loc7_);
         var _loc8_:SkeletonJson = new SkeletonJson(_loc6_);
         var _loc9_:SkeletonData = _loc8_.readSkeletonData(param4);
         SKELETON_DATAS.setData(param1,_loc9_);
         var _loc10_:Vector.<Function> = CALLBACKS.getData(param1) as Vector.<Function>;
         _loc11_ = 0;
         while(_loc11_ < _loc10_.length)
         {
            _loc10_[_loc11_](_loc9_);
            _loc11_++;
         }
         CALLBACKS.remove(param1);
      }
      
      private function loadJson() : void
      {
         if(!_jsonURL)
         {
            return;
         }
         getString(_jsonURL,jsonLoaded);
      }
      
      private function jsonLoaded(param1:String) : void
      {
         if(!_jsonURL)
         {
            return;
         }
         _json = param1;
         loadAtlas();
      }
      
      private function loadAtlas() : void
      {
         if(!_atlasURL)
         {
            return;
         }
         getString(_atlasURL,atlasLoaded);
      }
      
      private function atlasLoaded(param1:String) : void
      {
         if(!_atlasURL)
         {
            return;
         }
         _atlas = param1;
         loadTexture();
      }
      
      private function loadTexture() : void
      {
         if(!_textureURL)
         {
            return;
         }
         getBitmapData(_textureURL,_atlas,textureLoaded);
      }
      
      private function textureLoaded(param1:BitmapData) : void
      {
         if(!_textureURL)
         {
            return;
         }
         _texture = param1;
         getSpineData(_identifier,_atlas,_texture,_json,createSpine);
      }
      
      private function createSpine(param1:SkeletonData) : void
      {
         var _loc2_:AnimationStateData = new AnimationStateData(param1);
         initStateData(_loc2_);
         _skeleton = new SkeletonAnimation(param1,_loc2_);
         _spineDisplayObject = new FlashSprite(null,_skeleton);
         animationState.onEnd.add(animationCompleteHandler);
         animationState.onEvent.add(eventHandler);
         skeleton.setToSetupPose();
         _loaded = true;
         loaded();
         _content.addChild(_spineDisplayObject);
      }
      
      protected function loaded() : void
      {
      }
      
      override public function dispose() : void
      {
         if(_loaded)
         {
            animationState.onEnd.remove(animationCompleteHandler);
            animationState.onEvent.remove(eventHandler);
         }
         if(_spineDisplayObject)
         {
            _spineDisplayObject.dispose();
            _spineDisplayObject = null;
         }
         if(_skeleton)
         {
            _skeleton = null;
         }
         _texture = null;
         _textureURL = null;
         _atlasURL = null;
         _jsonURL = null;
         _loaded = false;
         super.dispose();
      }
      
      public function get identifier() : String
      {
         return _identifier;
      }
      
      public function get skeleton() : Skeleton
      {
         if(_skeleton)
         {
            return _skeleton.skeleton;
         }
         return null;
      }
      
      public function get animationState() : AnimationState
      {
         if(_skeleton)
         {
            return _skeleton.state;
         }
         return null;
      }
      
      public function get isLoaded() : Boolean
      {
         return _skeleton;
      }
      
      public function initStateData(param1:AnimationStateData) : void
      {
      }
      
      public function playAnimation(param1:String, param2:Boolean = true) : void
      {
         if(isLoaded)
         {
            animationState.setAnimationByName(0,param1,param2);
         }
      }
      
      public function chainAnimation(param1:String, param2:Boolean = true, param3:Number = 0) : void
      {
         if(isLoaded)
         {
            animationState.addAnimationByName(0,param1,param2,param3);
         }
      }
      
      private function eventHandler(param1:int, param2:Event) : void
      {
         onEvent(param2.data.name);
      }
      
      protected function onEvent(param1:String) : void
      {
      }
      
      private function animationCompleteHandler(param1:int) : void
      {
         var _loc2_:String = animationState.getCurrent(param1).animation.name;
         onAnimationComplete(_loc2_);
      }
      
      protected function onAnimationComplete(param1:String) : void
      {
      }
   }
}
