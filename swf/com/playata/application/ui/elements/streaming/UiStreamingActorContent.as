package com.playata.application.ui.elements.streaming
{
   import com.playata.application.data.constants.CStreamingActor;
   import com.playata.application.data.streaming.StreamingActor;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.streaming.SymbolStreamingActorContentGeneric;
   
   public class UiStreamingActorContent
   {
       
      
      private var _content:SymbolStreamingActorContentGeneric = null;
      
      private var _poses:Vector.<UiStreamingActorAnimation> = null;
      
      public function UiStreamingActorContent(param1:SymbolStreamingActorContentGeneric)
      {
         super();
         _content = param1;
         _content.txtName.autoFontSize = true;
         _content.txtDescription.autoFontSize = true;
         _poses = new Vector.<UiStreamingActorAnimation>();
         _poses.push(new UiStreamingActorAnimation(_content.pose1));
         _poses.push(new UiStreamingActorAnimation(_content.pose2));
         _poses.push(new UiStreamingActorAnimation(_content.pose3));
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < _poses.length)
         {
            _poses[_loc1_].dispose();
            _loc1_++;
         }
         _poses = null;
         _content = null;
      }
      
      public function refresh(param1:int) : void
      {
         actorId = param1;
         if(!_content)
         {
            return;
         }
         var actor:CStreamingActor = CStreamingActor.fromId(actorId);
         _content.txtName.text = LocText.current.text("streaming/actor/" + actor.identifier + "/name");
         _content.txtDescription.text = LocText.current.text("streaming/actor/" + actor.identifier + "/description");
         _content.image.setUriSprite(StreamingActor.getActorIconUrlBig(actorId),191,236,true,1);
         var poseIndex:int = 0;
         var animationIDs:Vector.<int> = actor.animationIds;
         animationIDs.sort(function(param1:int, param2:int):int
         {
            return actor.getAnimation(param1).sortIndex - actor.getAnimation(param2).sortIndex;
         });
         var i:int = 0;
         while(i < animationIDs.length)
         {
            _poses[poseIndex].refresh(actorId,animationIDs[i]);
            poseIndex = Number(poseIndex) + 1;
            i = Number(i) + 1;
         }
      }
   }
}
