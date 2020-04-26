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
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.guild.SymbolGuildEmblemGeneric;
   import visuals.ui.elements.icons.SymbolIconDurationGeneric;
   
   public class SymbolDialogGuildBattleViewGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildBattleView = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnView:SymbolUiButtonDefaultGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtOwnGuildName:ILabelArea = null;
      
      public var txtVs:ILabel = null;
      
      public var txtOtherGuildName:ILabelArea = null;
      
      public var emblemOwnGuild:SymbolGuildEmblemGeneric = null;
      
      public var emblemOtherGuild:SymbolGuildEmblemGeneric = null;
      
      public var txtTime:ILabel = null;
      
      public var iconTime:SymbolIconDurationGeneric = null;
      
      public function SymbolDialogGuildBattleViewGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildBattleView;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildBattleView();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnView = new SymbolUiButtonDefaultGeneric(_nativeObject.btnView);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtOwnGuildName = FlashLabelArea.fromNative(_nativeObject.txtOwnGuildName);
         txtVs = FlashLabel.fromNative(_nativeObject.txtVs);
         txtOtherGuildName = FlashLabelArea.fromNative(_nativeObject.txtOtherGuildName);
         emblemOwnGuild = new SymbolGuildEmblemGeneric(_nativeObject.emblemOwnGuild);
         emblemOtherGuild = new SymbolGuildEmblemGeneric(_nativeObject.emblemOtherGuild);
         txtTime = FlashLabel.fromNative(_nativeObject.txtTime);
         iconTime = new SymbolIconDurationGeneric(_nativeObject.iconTime);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildBattleView) : void
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
         if(_nativeObject.btnView)
         {
            btnView.setNativeInstance(_nativeObject.btnView);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabelArea.setNativeInstance(txtOwnGuildName,_nativeObject.txtOwnGuildName);
         FlashLabel.setNativeInstance(txtVs,_nativeObject.txtVs);
         FlashLabelArea.setNativeInstance(txtOtherGuildName,_nativeObject.txtOtherGuildName);
         if(_nativeObject.emblemOwnGuild)
         {
            emblemOwnGuild.setNativeInstance(_nativeObject.emblemOwnGuild);
         }
         if(_nativeObject.emblemOtherGuild)
         {
            emblemOtherGuild.setNativeInstance(_nativeObject.emblemOtherGuild);
         }
         FlashLabel.setNativeInstance(txtTime,_nativeObject.txtTime);
         if(_nativeObject.iconTime)
         {
            iconTime.setNativeInstance(_nativeObject.iconTime);
         }
      }
   }
}
