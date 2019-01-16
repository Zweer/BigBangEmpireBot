package visuals.ui.elements.mail
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.generic.SymbolGenericListLineEvenGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineHighlightGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineOddGeneric;
   import visuals.ui.elements.icons.SymbolIconExclamationMarkGeneric;
   import visuals.ui.elements.icons.SymbolIconGenderFemaleGeneric;
   import visuals.ui.elements.icons.SymbolIconGenderMaleGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildGeneric;
   import visuals.ui.elements.icons.SymbolIconOnlineGeneric;
   import visuals.ui.elements.icons.SymbolIconSystemMailGeneric;
   
   public class SymbolMailboxLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMailboxLine = null;
      
      public var backgroundHighlight:SymbolGenericListLineHighlightGeneric = null;
      
      public var backgroundEven:SymbolGenericListLineEvenGeneric = null;
      
      public var backgroundOdd:SymbolGenericListLineOddGeneric = null;
      
      public var iconGenderMale:SymbolIconGenderMaleGeneric = null;
      
      public var iconGenderFemale:SymbolIconGenderFemaleGeneric = null;
      
      public var iconSystemMail:SymbolIconSystemMailGeneric = null;
      
      public var iconGuild:SymbolIconGuildGeneric = null;
      
      public var iconOnline:SymbolIconOnlineGeneric = null;
      
      public var txtName:ILabelArea = null;
      
      public var txtSubject:ILabelArea = null;
      
      public var txtDate:ILabelArea = null;
      
      public var iconUnread:SymbolIconExclamationMarkGeneric = null;
      
      public function SymbolMailboxLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMailboxLine;
         }
         else
         {
            _nativeObject = new SymbolMailboxLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundHighlight = new SymbolGenericListLineHighlightGeneric(_nativeObject.backgroundHighlight);
         backgroundEven = new SymbolGenericListLineEvenGeneric(_nativeObject.backgroundEven);
         backgroundOdd = new SymbolGenericListLineOddGeneric(_nativeObject.backgroundOdd);
         iconGenderMale = new SymbolIconGenderMaleGeneric(_nativeObject.iconGenderMale);
         iconGenderFemale = new SymbolIconGenderFemaleGeneric(_nativeObject.iconGenderFemale);
         iconSystemMail = new SymbolIconSystemMailGeneric(_nativeObject.iconSystemMail);
         iconGuild = new SymbolIconGuildGeneric(_nativeObject.iconGuild);
         iconOnline = new SymbolIconOnlineGeneric(_nativeObject.iconOnline);
         txtName = FlashLabelArea.fromNative(_nativeObject.txtName);
         txtSubject = FlashLabelArea.fromNative(_nativeObject.txtSubject);
         txtDate = FlashLabelArea.fromNative(_nativeObject.txtDate);
         iconUnread = new SymbolIconExclamationMarkGeneric(_nativeObject.iconUnread);
      }
      
      public function setNativeInstance(param1:SymbolMailboxLine) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundHighlight)
         {
            backgroundHighlight.setNativeInstance(_nativeObject.backgroundHighlight);
         }
         if(_nativeObject.backgroundEven)
         {
            backgroundEven.setNativeInstance(_nativeObject.backgroundEven);
         }
         if(_nativeObject.backgroundOdd)
         {
            backgroundOdd.setNativeInstance(_nativeObject.backgroundOdd);
         }
         if(_nativeObject.iconGenderMale)
         {
            iconGenderMale.setNativeInstance(_nativeObject.iconGenderMale);
         }
         if(_nativeObject.iconGenderFemale)
         {
            iconGenderFemale.setNativeInstance(_nativeObject.iconGenderFemale);
         }
         if(_nativeObject.iconSystemMail)
         {
            iconSystemMail.setNativeInstance(_nativeObject.iconSystemMail);
         }
         if(_nativeObject.iconGuild)
         {
            iconGuild.setNativeInstance(_nativeObject.iconGuild);
         }
         if(_nativeObject.iconOnline)
         {
            iconOnline.setNativeInstance(_nativeObject.iconOnline);
         }
         FlashLabelArea.setNativeInstance(txtName,_nativeObject.txtName);
         FlashLabelArea.setNativeInstance(txtSubject,_nativeObject.txtSubject);
         FlashLabelArea.setNativeInstance(txtDate,_nativeObject.txtDate);
         if(_nativeObject.iconUnread)
         {
            iconUnread.setNativeInstance(_nativeObject.iconUnread);
         }
      }
   }
}
