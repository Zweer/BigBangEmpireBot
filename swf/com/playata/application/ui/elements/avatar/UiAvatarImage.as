package com.playata.application.ui.elements.avatar
{
   import com.playata.application.data.user.User;
   import com.playata.framework.display.DisplayObjectFactory;
   import com.playata.framework.display.IUriSprite;
   import com.playata.framework.display.UriSprite;
   import visuals.ui.base.SymbolBlockerAnimationGeneric;
   import visuals.ui.elements.avatar.SymbolAvatarDungeonNPCGeneric;
   import visuals.ui.elements.avatar.SymbolAvatarImagePlaceholderGeneric;
   import visuals.ui.elements.avatar.SymbolAvatarNPCGeneric;
   
   public class UiAvatarImage
   {
       
      
      private var _placeHolder:SymbolAvatarImagePlaceholderGeneric;
      
      private var _loaderAnimation:SymbolBlockerAnimationGeneric;
      
      private var _size:int;
      
      private var _scale:Number;
      
      private var _showLoader:Boolean;
      
      private var _avatarImage:AvatarImage = null;
      
      public function UiAvatarImage(param1:SymbolAvatarImagePlaceholderGeneric, param2:Boolean = true)
      {
         super();
         _placeHolder = param1;
         _showLoader = param2;
         param1.removeAllChildren();
         _scale = param1.scaleX;
         _size = Math.round(160 * _scale);
         if(_showLoader)
         {
            _loaderAnimation = new SymbolBlockerAnimationGeneric();
            var _loc3_:* = _size * 0.5;
            _loaderAnimation.y = _loc3_;
            _loaderAnimation.x = _loc3_;
         }
         _avatarImage = new AvatarImage();
      }
      
      public function dispose() : void
      {
         if(_placeHolder != null)
         {
            _placeHolder.removeAllChildren(true);
         }
         _avatarImage.dispose();
      }
      
      public function showNpcImage(param1:String) : void
      {
         if(_loaderAnimation && _loaderAnimation.parent != null)
         {
            _placeHolder.removeChild(_loaderAnimation);
         }
         var _loc3_:* = _scale;
         _placeHolder.scaleY = _loc3_;
         _placeHolder.scaleX = _loc3_;
         _placeHolder.removeAllChildren(true);
         var _loc2_:SymbolAvatarNPCGeneric = new SymbolAvatarNPCGeneric();
         _loc2_.npcImage.removeAllChildren();
         if(_showLoader)
         {
            _placeHolder.addChild(_loaderAnimation);
         }
         _loc2_.npcImage.addChild(UriSprite.load(param1,126,126,true,1,onCompleted,true));
         _placeHolder.addChild(_loc2_);
      }
      
      public function showDungeonNpcImage(param1:String) : void
      {
         if(_loaderAnimation && _loaderAnimation.parent != null)
         {
            _placeHolder.removeChild(_loaderAnimation);
         }
         var _loc3_:* = _scale;
         _placeHolder.scaleY = _loc3_;
         _placeHolder.scaleX = _loc3_;
         _placeHolder.removeAllChildren(true);
         var _loc2_:SymbolAvatarDungeonNPCGeneric = new SymbolAvatarDungeonNPCGeneric();
         _loc2_.npcImage.removeAllChildren();
         if(_showLoader)
         {
            _placeHolder.addChild(_loaderAnimation);
         }
         _loc2_.npcImage.addChild(UriSprite.load(param1,126,126,true,1,onCompleted,true));
         _placeHolder.addChild(_loc2_);
      }
      
      public function setToUser() : void
      {
         showPreview(User.current.character.avatarImage);
      }
      
      public function showWithSettings(param1:String) : void
      {
         showPreview(param1);
      }
      
      private function showPreview(param1:String) : void
      {
         if(_loaderAnimation && _loaderAnimation.parent != null)
         {
            _placeHolder.removeChild(_loaderAnimation);
         }
         _placeHolder.removeAllChildren(true);
         if(_loaderAnimation)
         {
            _placeHolder.addChild(_loaderAnimation);
            _loaderAnimation.visible = true;
         }
         _avatarImage.generateFromCompressedSettings(param1,onCompleted);
      }
      
      private function onCompleted(param1:IUriSprite = null) : void
      {
         _placeHolder.addChild(DisplayObjectFactory.createImageFromBitmap(_avatarImage.preview));
         if(_showLoader && _loaderAnimation.parent != null)
         {
            _placeHolder.removeChild(_loaderAnimation);
         }
      }
   }
}
