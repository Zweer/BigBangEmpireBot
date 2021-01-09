package com.playata.application.ui.elements.dungeon
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CDungeonTemplate;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.dungeon.SymbolDungeonPhotoButtonGeneric;
   
   public class UiDungeonButton extends UiButton
   {
       
      
      private var _realContent:SymbolDungeonPhotoButtonGeneric;
      
      private var _dungeonIdentifier:String;
      
      private var _defaultRotation:Number;
      
      public function UiDungeonButton(param1:SymbolDungeonPhotoButtonGeneric, param2:Function)
      {
         _realContent = param1;
         _defaultRotation = _realContent.rotation;
         super(param1,"",param2);
      }
      
      public function refresh(param1:String) : void
      {
         _dungeonIdentifier = param1;
         if(!_dungeonIdentifier)
         {
            return;
         }
         _realContent.photo.setUriSprite(GameUtil.getDungeonPreviewImageUrl(param1),102,103,true,1,null,true);
         var _loc2_:* = User.current.character.fansTotal < CDungeonTemplate.fromId(param1).getLevel(1).minFans;
         _realContent.lock.visible = _loc2_;
         tooltip = LocText.current.text("dungeon/" + param1 + "/name");
         if(_loc2_)
         {
            tooltip = tooltip + ("\n\n" + LocText.current.text("dialog/dungeon_select/dungeon_locked"));
         }
      }
      
      override protected function handleInteractionOver(param1:InteractionEvent) : void
      {
         _realContent.killTweens();
         _realContent.tweenTo(0.4,{"rotation":0});
         super.handleInteractionOver(param1);
      }
      
      override protected function handleInteractionOut(param1:InteractionEvent) : void
      {
         _realContent.killTweens();
         _realContent.tweenTo(0.4,{"rotation":_defaultRotation});
         super.handleInteractionOut(param1);
      }
      
      public function get dungeonIdentifier() : String
      {
         return _dungeonIdentifier;
      }
   }
}
