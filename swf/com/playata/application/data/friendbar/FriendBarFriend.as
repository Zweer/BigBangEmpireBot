package com.playata.application.data.friendbar
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.dataobject.DOFriend;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.display.IImage;
   
   public class FriendBarFriend extends DOFriend
   {
       
      
      private var _image:IImage = null;
      
      public function FriendBarFriend(param1:DOFriend)
      {
         super(param1);
      }
      
      override public function dispose() : void
      {
         Logger.debug("Destroying friend...");
         super.dispose();
         _image = null;
      }
      
      override public function update(param1:TypedObject) : void
      {
         var _loc2_:DOFriend = new DOFriend(param1);
         if(_loc2_.hasData("avatar_image") && avatarImage)
         {
            if(_loc2_.avatarImage != avatarImage)
            {
               _image = null;
            }
         }
         super.update(_loc2_);
      }
      
      public function get isCharacterOnline() : Boolean
      {
         return characterOnline;
      }
      
      override public function get avatarImage() : String
      {
         if(!hasData("avatar_image"))
         {
            return null;
         }
         return super.avatarImage;
      }
      
      override public function get platformName() : String
      {
         if(!hasData("platform_name"))
         {
            return null;
         }
         return super.platformName;
      }
      
      override public function get platformImageUrl() : String
      {
         if(!hasData("platform_image_url"))
         {
            return null;
         }
         return super.platformImageUrl;
      }
      
      override public function get platformImageWidth() : int
      {
         if(!hasData("platform_image_width"))
         {
            return 0;
         }
         return super.platformImageWidth;
      }
      
      override public function get platformImageHeight() : int
      {
         if(!hasData("platform_image_height"))
         {
            return 0;
         }
         return super.platformImageHeight;
      }
      
      override public function get isFriend() : Boolean
      {
         if(!hasData("is_friend"))
         {
            return false;
         }
         return super.isFriend;
      }
      
      override public function get isGuildMember() : Boolean
      {
         if(!hasData("is_guild_member"))
         {
            return false;
         }
         return super.isGuildMember;
      }
      
      public function get characterImage() : IImage
      {
         return _image;
      }
      
      public function setImage(param1:IImage) : void
      {
         if(!param1)
         {
            return;
         }
         _image = param1;
      }
      
      public function requestImage() : void
      {
         AppEnvironment.friendBar.requestFriendBarImage(userId,characterLevel,isCharacterOnline,avatarImage);
      }
   }
}
