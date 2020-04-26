package com.playata.application.data.character
{
   import com.playata.application.data.dataobject.DOCharacterSelectionEntry;
   import com.playata.application.data.friend.FriendBarImage;
   import com.playata.framework.display.IImage;
   
   public class CharacterSelectionEntry extends DOCharacterSelectionEntry
   {
       
      
      private var _image:IImage = null;
      
      private var _isLoadingImage:Boolean = false;
      
      private var _onLoaded:Function = null;
      
      public function CharacterSelectionEntry(param1:String, param2:Object = null)
      {
         param2.server_id = param1;
         super(param2);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _image = null;
      }
      
      public function get key() : String
      {
         return serverId + "_" + userId;
      }
      
      public function get serverId() : String
      {
         return getString("server_id");
      }
      
      public function get isEmailAccount() : Boolean
      {
         return platform == "standalone";
      }
      
      public function get isMobileAccount() : Boolean
      {
         return platform == "ios" || platform == "android";
      }
      
      public function get isFacebookAccount() : Boolean
      {
         return platform == "facebook";
      }
      
      public function get characterImage() : IImage
      {
         return _image;
      }
      
      public function loadPreviewImage(param1:Function) : void
      {
         if(_image)
         {
            return;
         }
         if(_isLoadingImage)
         {
            return;
         }
         _onLoaded = param1;
         _isLoadingImage = true;
         var _loc2_:String = avatarImage + "|" + level + "|false";
         FriendBarImage.buildFromHash(avatarImage,setImage,1);
      }
      
      private function setImage(param1:IImage) : void
      {
         _image = param1;
         _isLoadingImage = false;
      }
   }
}
