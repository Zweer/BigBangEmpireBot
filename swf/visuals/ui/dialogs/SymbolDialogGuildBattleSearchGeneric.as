package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.guild.SymbolGuildBattleSearchLineGeneric;
   
   public class SymbolDialogGuildBattleSearchGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildBattleSearch = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnAttack:SymbolUiButtonDefaultGeneric = null;
      
      public var btnView:SymbolUiButtonDefaultGeneric = null;
      
      public var line1:SymbolGuildBattleSearchLineGeneric = null;
      
      public var line2:SymbolGuildBattleSearchLineGeneric = null;
      
      public var line3:SymbolGuildBattleSearchLineGeneric = null;
      
      public var line4:SymbolGuildBattleSearchLineGeneric = null;
      
      public var line5:SymbolGuildBattleSearchLineGeneric = null;
      
      public var line6:SymbolGuildBattleSearchLineGeneric = null;
      
      public var line7:SymbolGuildBattleSearchLineGeneric = null;
      
      public var line8:SymbolGuildBattleSearchLineGeneric = null;
      
      public var line9:SymbolGuildBattleSearchLineGeneric = null;
      
      public var line10:SymbolGuildBattleSearchLineGeneric = null;
      
      public var line11:SymbolGuildBattleSearchLineGeneric = null;
      
      public var line12:SymbolGuildBattleSearchLineGeneric = null;
      
      public var txtNameCaption:ILabel = null;
      
      public var txtLevelCaption:ILabel = null;
      
      public var txtMemberCaption:ILabel = null;
      
      public var txtHonorCaption:ILabel = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public function SymbolDialogGuildBattleSearchGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildBattleSearch;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildBattleSearch();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnAttack = new SymbolUiButtonDefaultGeneric(_nativeObject.btnAttack);
         btnView = new SymbolUiButtonDefaultGeneric(_nativeObject.btnView);
         line1 = new SymbolGuildBattleSearchLineGeneric(_nativeObject.line1);
         line2 = new SymbolGuildBattleSearchLineGeneric(_nativeObject.line2);
         line3 = new SymbolGuildBattleSearchLineGeneric(_nativeObject.line3);
         line4 = new SymbolGuildBattleSearchLineGeneric(_nativeObject.line4);
         line5 = new SymbolGuildBattleSearchLineGeneric(_nativeObject.line5);
         line6 = new SymbolGuildBattleSearchLineGeneric(_nativeObject.line6);
         line7 = new SymbolGuildBattleSearchLineGeneric(_nativeObject.line7);
         line8 = new SymbolGuildBattleSearchLineGeneric(_nativeObject.line8);
         line9 = new SymbolGuildBattleSearchLineGeneric(_nativeObject.line9);
         line10 = new SymbolGuildBattleSearchLineGeneric(_nativeObject.line10);
         line11 = new SymbolGuildBattleSearchLineGeneric(_nativeObject.line11);
         line12 = new SymbolGuildBattleSearchLineGeneric(_nativeObject.line12);
         txtNameCaption = FlashLabel.fromNative(_nativeObject.txtNameCaption);
         txtLevelCaption = FlashLabel.fromNative(_nativeObject.txtLevelCaption);
         txtMemberCaption = FlashLabel.fromNative(_nativeObject.txtMemberCaption);
         txtHonorCaption = FlashLabel.fromNative(_nativeObject.txtHonorCaption);
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildBattleSearch) : void
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
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnAttack)
         {
            btnAttack.setNativeInstance(_nativeObject.btnAttack);
         }
         if(_nativeObject.btnView)
         {
            btnView.setNativeInstance(_nativeObject.btnView);
         }
         if(_nativeObject.line1)
         {
            line1.setNativeInstance(_nativeObject.line1);
         }
         if(_nativeObject.line2)
         {
            line2.setNativeInstance(_nativeObject.line2);
         }
         if(_nativeObject.line3)
         {
            line3.setNativeInstance(_nativeObject.line3);
         }
         if(_nativeObject.line4)
         {
            line4.setNativeInstance(_nativeObject.line4);
         }
         if(_nativeObject.line5)
         {
            line5.setNativeInstance(_nativeObject.line5);
         }
         if(_nativeObject.line6)
         {
            line6.setNativeInstance(_nativeObject.line6);
         }
         if(_nativeObject.line7)
         {
            line7.setNativeInstance(_nativeObject.line7);
         }
         if(_nativeObject.line8)
         {
            line8.setNativeInstance(_nativeObject.line8);
         }
         if(_nativeObject.line9)
         {
            line9.setNativeInstance(_nativeObject.line9);
         }
         if(_nativeObject.line10)
         {
            line10.setNativeInstance(_nativeObject.line10);
         }
         if(_nativeObject.line11)
         {
            line11.setNativeInstance(_nativeObject.line11);
         }
         if(_nativeObject.line12)
         {
            line12.setNativeInstance(_nativeObject.line12);
         }
         FlashLabel.setNativeInstance(txtNameCaption,_nativeObject.txtNameCaption);
         FlashLabel.setNativeInstance(txtLevelCaption,_nativeObject.txtLevelCaption);
         FlashLabel.setNativeInstance(txtMemberCaption,_nativeObject.txtMemberCaption);
         FlashLabel.setNativeInstance(txtHonorCaption,_nativeObject.txtHonorCaption);
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
      }
   }
}
