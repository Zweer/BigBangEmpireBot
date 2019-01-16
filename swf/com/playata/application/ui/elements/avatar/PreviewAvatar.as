package com.playata.application.ui.elements.avatar
{
   import com.playata.application.data.character.AppearanceSettings;
   
   public class PreviewAvatar
   {
      
      public static var hidePantiesAllowed:Boolean = false;
      
      public static var hideBraAllowed:Boolean = false;
      
      private static var _previewInitted:Boolean;
      
      private static var _previewAvatar:Avatar;
      
      private static var _previewAvatarLock:Object = null;
       
      
      public function PreviewAvatar()
      {
         super();
      }
      
      public static function lockPreviewAvatar(param1:Object) : Boolean
      {
         if(_previewAvatarLock == null || _previewAvatarLock == param1)
         {
            _previewAvatarLock = param1;
            return true;
         }
         return false;
      }
      
      public static function unlockPreviewAvatar(param1:Object) : void
      {
         if(_previewAvatarLock == param1)
         {
            _previewAvatarLock = null;
         }
      }
      
      public static function getPreviewAvatar(param1:Object) : Avatar
      {
         if(_previewAvatarLock == param1)
         {
            return _previewAvatar;
         }
         return null;
      }
      
      public static function updatePreviewAvatar(param1:AppearanceSettings, param2:Object) : void
      {
         if(_previewAvatarLock != param2)
         {
            return;
         }
         if(!_previewInitted)
         {
            _previewAvatar = new Avatar(false,false,hidePantiesAllowed,hideBraAllowed);
            var _loc3_:* = false;
            _previewAvatar.mouseChildren = _loc3_;
            _previewAvatar.mouseEnabled = _loc3_;
            _loc3_ = 2;
            _previewAvatar.scaleY = _loc3_;
            _previewAvatar.scaleX = _loc3_;
            _previewInitted = true;
         }
         _previewAvatar.update(param1);
      }
      
      public static function previewComplete(param1:Object) : Boolean
      {
         if(_previewAvatarLock != param1)
         {
            return false;
         }
         var _loc2_:Boolean = _previewAvatar.isAvatarImageLoaded;
         if(_loc2_)
         {
            _previewAvatar.hideCensorBars();
         }
         return _loc2_;
      }
   }
}
