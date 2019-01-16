package com.playata.application.data.friend
{
   import com.playata.application.data.dataobject.DOFriend;
   import com.playata.application.data.user.User;
   import flash.display.Bitmap;
   
   public class Friend extends DOFriend
   {
       
      
      private var _image:Bitmap = null;
      
      public function Friend(param1:DOFriend)
      {
         super(param1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _image = null;
      }
      
      override public function get avatarImage() : String
      {
         if(!hasData("avatar_image"))
         {
            return null;
         }
         return super.avatarImage;
      }
      
      public function get characterImage() : Bitmap
      {
         return _image;
      }
      
      public function get isMe() : Boolean
      {
         return userId == User.current.id;
      }
   }
}
