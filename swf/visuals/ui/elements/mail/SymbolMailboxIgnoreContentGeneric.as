package visuals.ui.elements.mail
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolIconButtonCharacterGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   
   public class SymbolMailboxIgnoreContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMailboxIgnoreContent = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var txtNameCaption:ILabel = null;
      
      public var txtNoIgnores:ILabelArea = null;
      
      public var btnUnignore:SymbolUiButtonDefaultGeneric = null;
      
      public var txtIgnoreDateCaption:ILabel = null;
      
      public var btnViewPlayer:SymbolIconButtonCharacterGeneric = null;
      
      public var line1:SymbolMailboxIgnoreLineGeneric = null;
      
      public var line2:SymbolMailboxIgnoreLineGeneric = null;
      
      public var line3:SymbolMailboxIgnoreLineGeneric = null;
      
      public var line4:SymbolMailboxIgnoreLineGeneric = null;
      
      public var line5:SymbolMailboxIgnoreLineGeneric = null;
      
      public var line6:SymbolMailboxIgnoreLineGeneric = null;
      
      public var line7:SymbolMailboxIgnoreLineGeneric = null;
      
      public var line8:SymbolMailboxIgnoreLineGeneric = null;
      
      public var line9:SymbolMailboxIgnoreLineGeneric = null;
      
      public var checkboxIgnoreGuildInvites:SymbolUiCheckboxGeneric = null;
      
      public var txtIgnoreGuildInvites:ILabel = null;
      
      public function SymbolMailboxIgnoreContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMailboxIgnoreContent;
         }
         else
         {
            _nativeObject = new SymbolMailboxIgnoreContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         txtNameCaption = FlashLabel.fromNative(_nativeObject.txtNameCaption);
         txtNoIgnores = FlashLabelArea.fromNative(_nativeObject.txtNoIgnores);
         btnUnignore = new SymbolUiButtonDefaultGeneric(_nativeObject.btnUnignore);
         txtIgnoreDateCaption = FlashLabel.fromNative(_nativeObject.txtIgnoreDateCaption);
         btnViewPlayer = new SymbolIconButtonCharacterGeneric(_nativeObject.btnViewPlayer);
         line1 = new SymbolMailboxIgnoreLineGeneric(_nativeObject.line1);
         line2 = new SymbolMailboxIgnoreLineGeneric(_nativeObject.line2);
         line3 = new SymbolMailboxIgnoreLineGeneric(_nativeObject.line3);
         line4 = new SymbolMailboxIgnoreLineGeneric(_nativeObject.line4);
         line5 = new SymbolMailboxIgnoreLineGeneric(_nativeObject.line5);
         line6 = new SymbolMailboxIgnoreLineGeneric(_nativeObject.line6);
         line7 = new SymbolMailboxIgnoreLineGeneric(_nativeObject.line7);
         line8 = new SymbolMailboxIgnoreLineGeneric(_nativeObject.line8);
         line9 = new SymbolMailboxIgnoreLineGeneric(_nativeObject.line9);
         checkboxIgnoreGuildInvites = new SymbolUiCheckboxGeneric(_nativeObject.checkboxIgnoreGuildInvites);
         txtIgnoreGuildInvites = FlashLabel.fromNative(_nativeObject.txtIgnoreGuildInvites);
      }
      
      public function setNativeInstance(param1:SymbolMailboxIgnoreContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
         FlashLabel.setNativeInstance(txtNameCaption,_nativeObject.txtNameCaption);
         FlashLabelArea.setNativeInstance(txtNoIgnores,_nativeObject.txtNoIgnores);
         if(_nativeObject.btnUnignore)
         {
            btnUnignore.setNativeInstance(_nativeObject.btnUnignore);
         }
         FlashLabel.setNativeInstance(txtIgnoreDateCaption,_nativeObject.txtIgnoreDateCaption);
         if(_nativeObject.btnViewPlayer)
         {
            btnViewPlayer.setNativeInstance(_nativeObject.btnViewPlayer);
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
         if(_nativeObject.checkboxIgnoreGuildInvites)
         {
            checkboxIgnoreGuildInvites.setNativeInstance(_nativeObject.checkboxIgnoreGuildInvites);
         }
         FlashLabel.setNativeInstance(txtIgnoreGuildInvites,_nativeObject.txtIgnoreGuildInvites);
      }
   }
}
