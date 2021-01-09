package com.playata.application.ui.elements.stream
{
   import com.playata.application.data.user.User;
   import com.playata.framework.display.IMovieClip;
   
   public class UiSystemStreamIcon
   {
       
      
      private var _content:IMovieClip;
      
      public function UiSystemStreamIcon(param1:IMovieClip)
      {
         super();
         _content = param1;
      }
      
      public function refresh(param1:Boolean) : void
      {
         if(!param1)
         {
            _content.visible = false;
            return;
         }
         var _loc2_:* = "default";
         var _loc3_:String = User.current.getWhiteLabelId();
         if(_loc3_)
         {
            _loc2_ = _loc3_;
         }
         try
         {
            _content.gotoAndStop(_loc2_);
         }
         catch(e:Error)
         {
         }
         _content.visible = true;
      }
   }
}
