package com.playata.application.task
{
   import com.playata.application.ui.elements.avatar.AvatarImage;
   import com.playata.framework.display.IUriSprite;
   import com.playata.framework.task.Task;
   
   public class FriendBarImageTask extends Task
   {
       
      
      private var _avatarImage:AvatarImage;
      
      private var _scaling:Number;
      
      public function FriendBarImageTask(param1:int, param2:Function, param3:Function, param4:Function)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function start(... rest) : void
      {
         _scaling = rest[1];
         _avatarImage = new AvatarImage();
         _avatarImage.generateFromCompressedSettings(rest[0],onCompleted);
      }
      
      private function onCompleted(param1:IUriSprite = null) : void
      {
         sendResultByteArray(_avatarImage.getBitMapdataByteArray(_scaling,null),_avatarImage.preview.width * _scaling,_avatarImage.preview.height * _scaling);
      }
   }
}
