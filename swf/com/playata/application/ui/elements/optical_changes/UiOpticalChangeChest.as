package com.playata.application.ui.elements.optical_changes
{
   import com.greensock.easing.Quart;
   import com.greensock.easing.Sine;
   import com.playata.application.data.constants.COpticalChange;
   import com.playata.application.data.dataobject.DOOpticalChangeChest;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.optical_changes.OpticalChange;
   import com.playata.application.data.optical_changes.OpticalChangeCategorie;
   import com.playata.application.data.optical_changes.OpticalChanges;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.dialogs.DialogOpenOpticalChangeChests;
   import com.playata.application.ui.effects.GlowFilterEffect;
   import com.playata.application.ui.elements.item.UiItemGraphic;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.tween.Tween;
   import visuals.ui.elements.optical_changes.SymbolOpticalChangeChestGeneric;
   
   public class UiOpticalChangeChest extends InteractiveDisplayObject
   {
      
      private static const Idle:int = 1;
      
      private static const MoveToPosition:int = 2;
      
      private static const AtPosition:int = 3;
      
      private static const Open:int = 4;
      
      private static const Opened:int = 5;
      
      private static const Closing:int = 6;
       
      
      private var _chest:TypedObject;
      
      private var _dialog:DialogOpenOpticalChangeChests;
      
      private var _filter:GlowFilterEffect;
      
      private var _spine:SpineOpticalChangeChestEffects;
      
      private var _content:SymbolOpticalChangeChestGeneric;
      
      private var _data:DOOpticalChangeChest;
      
      private var _opticalChangeIcon:UiOpticalChangeIconSlot;
      
      private var _status:int = 1;
      
      private var _skipped:Boolean = false;
      
      private var _targetX:int;
      
      private var _targetY:int;
      
      private var _scale:Number;
      
      private var _itemSlot:UiItemSlot = null;
      
      private var _showItemSlot:Boolean = true;
      
      public function UiOpticalChangeChest(param1:Object, param2:DialogOpenOpticalChangeChests)
      {
         _chest = new TypedObject(param1);
         _dialog = param2;
         _content = new SymbolOpticalChangeChestGeneric();
         super(_content);
         _spine = new SpineOpticalChangeChestEffects(_chest.getInt("rarity"));
         _itemSlot = new UiItemSlot(_content.itemSlot,0);
         _content.spine.removeAllChildren(true);
         _content.spine.addChild(_spine);
         _spine.idle();
         if(Environment.info.isTouchScreen)
         {
            onClick.add(handleClick);
         }
         else
         {
            onInteractionOver.add(handleOver);
            onInteractionOut.add(handleOut);
         }
         _filter = UiItemGraphic.getItemGlowEffect(_chest.getInt("rarity"),this);
         _opticalChangeIcon = new UiOpticalChangeIconSlot(_content.opticalChangeIcon);
         _content.opticalChangeIcon.visible = false;
         maskObject.width = 0;
         _content.txtOpticalChangeName.autoFontSize = true;
         _content.txtOpticalChangeQualityCommon.visible = false;
         _content.txtOpticalChangeQualityRare.visible = false;
         _content.txtOpticalChangeQualityEpic.visible = false;
         _content.txtOpticalChangeName.visible = false;
         _content.txtOpticalChangeType.visible = false;
         _content.itemSlot.visible = false;
         _content.txtOpticalChangeType.autoFontSize = true;
         _content.txtOpticalChangeQualityCommon.text = "(" + LocText.current.text("general/item_common") + ")";
         _content.txtOpticalChangeQualityRare.text = "(" + LocText.current.text("general/item_rare") + ")";
         _content.txtOpticalChangeQualityEpic.text = "(" + LocText.current.text("general/item_epic") + ")";
      }
      
      override public function dispose() : void
      {
         _content.dispose();
         _content = null;
         _itemSlot.dispose();
         _itemSlot = null;
         _dialog = null;
         _data = null;
         _chest = null;
         if(_filter)
         {
            _filter.dispose();
            _filter = null;
         }
         _spine.dispose();
         _spine = null;
         _opticalChangeIcon.dispose();
         _opticalChangeIcon = null;
         super.dispose();
      }
      
      private function get maskObject() : IDisplayObject
      {
         return _content.m;
      }
      
      public function get chest() : TypedObject
      {
         return _chest;
      }
      
      private function handleOver(param1:InteractionEvent) : void
      {
         this.bringToTop();
         if(_status == 5)
         {
            Tween.to(maskObject,0.2,{
               "width":335,
               "ease":Quart.easeIn
            });
         }
      }
      
      private function handleOut(param1:InteractionEvent) : void
      {
         Tween.to(maskObject,0.2,{
            "width":1,
            "ease":Quart.easeIn
         });
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         if(_status == 5)
         {
            param1.stopPropagation();
            if(maskObject.isTweening)
            {
               return;
            }
            if(maskObject.width > 1)
            {
               handleOut(param1);
            }
            else
            {
               handleOver(param1);
            }
         }
      }
      
      public function moveToPosition(param1:int, param2:int, param3:Number) : void
      {
         _status = 2;
         _targetX = param1;
         _targetY = param2;
         _scale = param3;
         var _loc6_:int = 300;
         var _loc4_:Number = Math.max(Math.abs(_targetX / _loc6_) > Math.abs(_targetY / _loc6_)?Math.abs(_targetX / _loc6_):Number(Math.abs(_targetY / _loc6_)),0.5);
         var _loc5_:Number = NumberUtil.randomNumber(0.5,1);
         Tween.to(this,_loc4_,{
            "delay":_loc5_,
            "x":_targetX,
            "ease":Sine.easeIn,
            "scale":_scale
         });
         Tween.to(this,_loc4_,{
            "delay":_loc5_,
            "y":_targetY,
            "ease":Quart.easeIn,
            "onComplete":moveToPositionFinished
         });
      }
      
      private function moveToPositionFinished() : void
      {
         _status = 3;
         if(_skipped)
         {
            skipAnimation();
         }
         else
         {
            playOpenAnimation();
         }
      }
      
      public function setOpticalChangeData(param1:DOOpticalChangeChest) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc5_:* = null;
         _data = param1;
         var _loc4_:OpticalChange = null;
         if(_data.itemId > 0)
         {
            _loc2_ = User.current.character.getItemById(_data.itemId);
            _itemSlot.item = _loc2_;
            _content.txtOpticalChangeName.text = _loc2_.name;
            _content.txtOpticalChangeType.text = _loc2_.typeName;
            _content.txtOpticalChangeName.visible = true;
            _content.txtOpticalChangeType.visible = true;
            if(_loc2_.quality == 1)
            {
               _content.txtOpticalChangeQualityCommon.visible = true;
            }
            else if(_loc2_.quality == 2)
            {
               _content.txtOpticalChangeQualityRare.visible = true;
            }
            else if(_loc2_.quality == 3)
            {
               _content.txtOpticalChangeQualityEpic.visible = true;
            }
            _content.itemSlot.alpha = 0;
            _content.itemSlot.visible = true;
            _content.itemSlot.x = -45;
            _content.itemSlot.y = -120;
            _showItemSlot = true;
            if(_data.newOpticalChangeId > 0)
            {
               _loc4_ = OpticalChanges.instance.getOpticalChangeById(_data.newOpticalChangeId);
               _opticalChangeIcon.refresh(_loc4_,true);
               _content.opticalChangeIcon.visible = true;
               _content.opticalChangeIcon.alpha = 0;
               _content.opticalChangeIcon.x = -45;
               _content.opticalChangeIcon.y = -120;
               _showItemSlot = false;
            }
         }
         else
         {
            _loc3_ = _data.newOpticalChangeId;
            _loc5_ = OpticalChanges.instance.getOpticalChangeCategorieOfType(COpticalChange.fromId(_loc3_).type);
            _loc4_ = OpticalChanges.instance.getOpticalChangeById(_loc3_);
            _opticalChangeIcon.refresh(_loc4_,true);
            _content.opticalChangeIcon.visible = true;
            _content.opticalChangeIcon.alpha = 0;
            _content.opticalChangeIcon.x = -45;
            _content.opticalChangeIcon.y = -120;
            _content.txtOpticalChangeName.text = _loc4_.name;
            _content.txtOpticalChangeType.text = _loc5_.title;
            _content.txtOpticalChangeName.visible = true;
            _content.txtOpticalChangeType.visible = true;
            if(_loc4_.rarity == 1)
            {
               _content.txtOpticalChangeQualityCommon.visible = true;
            }
            else if(_loc4_.rarity == 2)
            {
               _content.txtOpticalChangeQualityRare.visible = true;
            }
            else if(_loc4_.rarity == 3)
            {
               _content.txtOpticalChangeQualityEpic.visible = true;
            }
         }
         if(_status == 3)
         {
            if(_skipped)
            {
               skipAnimation();
            }
            else
            {
               playOpenAnimation();
            }
         }
      }
      
      private function playOpenAnimation() : void
      {
         if(!_data || _status != 3)
         {
            return;
         }
         _status = 4;
         _content.spine.addChild(_spine);
         _spine.open(playOpticalChangeIconEffect);
      }
      
      public function playOpticalChangeIconEffect(param1:Boolean = true) : void
      {
         if(!_data)
         {
            return;
         }
         if(param1)
         {
            Tween.to(_content.opticalChangeIcon,0.2,{
               "alpha":1,
               "ease":Sine.easeIn
            });
            Tween.to(_content.opticalChangeIcon,0.5,{
               "x":-91,
               "ease":Sine.easeIn
            });
            Tween.to(_content.opticalChangeIcon,0.5,{
               "y":-114,
               "ease":Quart.easeIn
            });
            Tween.to(_content.itemSlot,0.2,{
               "alpha":(!!_showItemSlot?1:0),
               "ease":Sine.easeIn
            });
            Tween.to(_content.itemSlot,0.5,{
               "x":-77,
               "ease":Sine.easeIn
            });
            Tween.to(_content.itemSlot,0.5,{
               "y":-105,
               "ease":Quart.easeIn,
               "onComplete":playOpticalChangeIconEffectFinished
            });
         }
         else
         {
            _content.opticalChangeIcon.alpha = 1;
            _content.opticalChangeIcon.x = -91;
            _content.opticalChangeIcon.y = -114;
            _content.itemSlot.alpha = !!_showItemSlot?1:0;
            _content.itemSlot.x = -77;
            _content.itemSlot.y = -105;
            playOpticalChangeIconEffectFinished();
         }
      }
      
      private function playOpticalChangeIconEffectFinished() : void
      {
         _status = 5;
      }
      
      private function closeChest() : void
      {
         _status = 6;
         _dialog.chestClosed(this);
      }
      
      public function skipAnimation() : void
      {
         if(!_content)
         {
            return;
         }
         _skipped = true;
         if(_status == 2)
         {
            Tween.killTweensOf(this);
            this.x = _targetX;
            this.y = _targetY;
            this.scale = _scale;
            moveToPositionFinished();
         }
         else if(_status == 3)
         {
            if(_data)
            {
               Tween.killTweensOf(this);
               _spine.openIdle();
               playOpticalChangeIconEffect(false);
            }
         }
         else if(_status == 4)
         {
            Tween.killTweensOf(this);
            _spine.openIdle();
            playOpticalChangeIconEffect(false);
         }
         else if(Tween.isTweening(_content.opticalChangeIcon))
         {
            Tween.killTweensOf(_content.opticalChangeIcon);
            Tween.killTweensOf(_content.itemSlot);
            Tween.killTweensOf(maskObject);
            playOpticalChangeIconEffect(false);
         }
         else if(_status == 5)
         {
            closeChest();
         }
      }
   }
}
