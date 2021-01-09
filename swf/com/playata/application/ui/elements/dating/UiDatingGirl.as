package com.playata.application.ui.elements.dating
{
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IUriSprite;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashUriSprite;
   
   public class UiDatingGirl
   {
       
      
      private var _content:Sprite = null;
      
      private var _datingIndex:int = 0;
      
      private var _stepIndex:int = 0;
      
      private var _showAnimation:Boolean = false;
      
      public function UiDatingGirl(param1:Sprite)
      {
         super();
         _content = param1;
         _content.visible = false;
         _content.nativeInstance.mouseChildren = false;
         _content.applySettings(new TypedObject({"interactionEnabled":false}));
      }
      
      public function get content() : IDisplayObject
      {
         return _content;
      }
      
      public function dispose() : void
      {
         _content = null;
      }
      
      public function refresh(param1:int, param2:int, param3:Boolean = false) : void
      {
         if(param1 > 0 && param2 > 0)
         {
            _datingIndex = param1;
            _stepIndex = param2;
            _showAnimation = param3;
            _content.visible = false;
            _content.removeAllChildren();
            _content.setUriSprite(DatingUtil.getGirlImageUrl(_datingIndex,_stepIndex),720,840,true,1,onLoadComplete);
         }
      }
      
      public function refreshTutorialGirl() : void
      {
         _content.visible = true;
         _content.setUriSprite(DatingUtil.getGirlImageUrl(0,0),720,840,true,1);
      }
      
      private function onLoadComplete(param1:IUriSprite) : void
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         if(!_content)
         {
            return;
         }
         var _loc3_:IDisplayObject = null;
         try
         {
            _content.visible = true;
            _loc3_ = param1;
            if(param1.isDownloaded)
            {
               _loc4_ = _loc3_ as FlashUriSprite;
               _loc4_.realLoader.content["showStep"](_stepIndex,_showAnimation);
            }
            return;
         }
         catch(e:Error)
         {
            _loc2_ = "Unable to show dating girl, current datingIndex: " + _datingIndex + ", current stepIndex: " + _stepIndex + ", Type of GirlContent: " + Runtime.getClassName(_loc3_);
            _loc2_ = _loc2_ + ("\nThe internal error was: " + e.toString());
            Environment.reportError(_loc2_,null,false);
            return;
         }
      }
   }
}
