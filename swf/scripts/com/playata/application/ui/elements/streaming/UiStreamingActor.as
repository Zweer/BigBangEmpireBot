package com.playata.application.ui.elements.streaming
{
   import com.playata.application.data.constants.CStreamingActor;
   import com.playata.application.data.streaming.StreamingShow;
   import com.playata.framework.display.Sprite;
   
   public class UiStreamingActor
   {
      
      private static var _enableAnimations:Boolean = true;
      
      private static var _streamingActors:Vector.<UiStreamingActor> = new Vector.<UiStreamingActor>();
       
      
      private var _content:Sprite = null;
      
      private var _streamingShowHash:String = null;
      
      private var _streamingShow:StreamingShow = null;
      
      private var _spineAnimation:SpineStreamingActor = null;
      
      public function UiStreamingActor(param1:Sprite)
      {
         super();
         _content = param1;
         _content.removeAllChildren(false);
         _streamingActors.push(this);
      }
      
      public static function get enableAnimations() : Boolean
      {
         return _enableAnimations;
      }
      
      public static function set enableAnimations(param1:Boolean) : void
      {
         if(_enableAnimations == param1)
         {
            return;
         }
         _enableAnimations = param1;
         var _loc4_:int = 0;
         var _loc3_:* = _streamingActors;
         for each(var _loc2_ in _streamingActors)
         {
            _loc2_.restartAnimation();
         }
      }
      
      public function dispose() : void
      {
         _content = null;
         if(_spineAnimation)
         {
            _spineAnimation.dispose();
            _spineAnimation = null;
         }
         _streamingActors.splice(_streamingActors.indexOf(this),1);
      }
      
      public function stop() : void
      {
         if(_spineAnimation)
         {
            _spineAnimation.dispose();
            _spineAnimation = null;
         }
         _content.removeAllChildren(false);
      }
      
      public function restartAnimation() : void
      {
         _streamingShowHash = null;
         refresh(_streamingShow);
      }
      
      public function refresh(param1:StreamingShow) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         if(!param1)
         {
            return;
         }
         _streamingShow = param1;
         var _loc3_:String = _streamingShow.actorId + "_" + _streamingShow.animationId;
         if(_loc3_ == _streamingShowHash)
         {
            return;
         }
         if(_spineAnimation)
         {
            _spineAnimation.dispose();
            _spineAnimation = null;
         }
         _content.removeAllChildren(false);
         if(enableAnimations)
         {
            _loc2_ = CStreamingActor.fromId(_streamingShow.actorId).identifier;
            _loc4_ = "streaming_pose_" + _streamingShow.animationId;
            _spineAnimation = new SpineStreamingActor(_loc4_,_loc2_);
            _spineAnimation.scale = 1;
            _spineAnimation.play();
            _content.addChild(_spineAnimation);
         }
         else
         {
            _content.setUriSprite(_streamingShow.actorPoseImageUrl,162,197,true,3);
         }
      }
   }
}
