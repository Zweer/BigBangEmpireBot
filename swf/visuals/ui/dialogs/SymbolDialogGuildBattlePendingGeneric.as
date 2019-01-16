package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.guild.SymbolButtonGuildBattleAttackGeneric;
   import visuals.ui.elements.guild.SymbolButtonGuildBattleDefendGeneric;
   import visuals.ui.elements.guild.SymbolGuildEmblemGeneric;
   import visuals.ui.elements.icons.SymbolIconDurationGeneric;
   
   public class SymbolDialogGuildBattlePendingGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildBattlePending = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnAttack:SymbolButtonGuildBattleAttackGeneric = null;
      
      public var btnDefend:SymbolButtonGuildBattleDefendGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var emblem:SymbolGuildEmblemGeneric = null;
      
      public var txtTime:ILabel = null;
      
      public var txtGuildName:ILabel = null;
      
      public var iconTime:SymbolIconDurationGeneric = null;
      
      public function SymbolDialogGuildBattlePendingGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildBattlePending;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildBattlePending();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnAttack = new SymbolButtonGuildBattleAttackGeneric(_nativeObject.btnAttack);
         btnDefend = new SymbolButtonGuildBattleDefendGeneric(_nativeObject.btnDefend);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         emblem = new SymbolGuildEmblemGeneric(_nativeObject.emblem);
         txtTime = FlashLabel.fromNative(_nativeObject.txtTime);
         txtGuildName = FlashLabel.fromNative(_nativeObject.txtGuildName);
         iconTime = new SymbolIconDurationGeneric(_nativeObject.iconTime);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildBattlePending) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         if(_nativeObject.btnAttack)
         {
            btnAttack.setNativeInstance(_nativeObject.btnAttack);
         }
         if(_nativeObject.btnDefend)
         {
            btnDefend.setNativeInstance(_nativeObject.btnDefend);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.emblem)
         {
            emblem.setNativeInstance(_nativeObject.emblem);
         }
         FlashLabel.setNativeInstance(txtTime,_nativeObject.txtTime);
         FlashLabel.setNativeInstance(txtGuildName,_nativeObject.txtGuildName);
         if(_nativeObject.iconTime)
         {
            iconTime.setNativeInstance(_nativeObject.iconTime);
         }
      }
   }
}
