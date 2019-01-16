package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineEvenGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineHighlightGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineOddGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildMembersGeneric;
   
   public class SymbolGuildSearchLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildSearchLine = null;
      
      public var backgroundHighlight:SymbolGenericListLineHighlightGeneric = null;
      
      public var backgroundEven:SymbolGenericListLineEvenGeneric = null;
      
      public var backgroundOdd:SymbolGenericListLineOddGeneric = null;
      
      public var txtName:ILabelArea = null;
      
      public var txtTotalPercentage:ILabelArea = null;
      
      public var txtMembers:ILabelArea = null;
      
      public var iconMembers:SymbolIconGuildMembersGeneric = null;
      
      public var emblem:SymbolGuildEmblemGeneric = null;
      
      public var iconLocale:SymbolPlaceholderGeneric = null;
      
      public function SymbolGuildSearchLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildSearchLine;
         }
         else
         {
            _nativeObject = new SymbolGuildSearchLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundHighlight = new SymbolGenericListLineHighlightGeneric(_nativeObject.backgroundHighlight);
         backgroundEven = new SymbolGenericListLineEvenGeneric(_nativeObject.backgroundEven);
         backgroundOdd = new SymbolGenericListLineOddGeneric(_nativeObject.backgroundOdd);
         txtName = FlashLabelArea.fromNative(_nativeObject.txtName);
         txtTotalPercentage = FlashLabelArea.fromNative(_nativeObject.txtTotalPercentage);
         txtMembers = FlashLabelArea.fromNative(_nativeObject.txtMembers);
         iconMembers = new SymbolIconGuildMembersGeneric(_nativeObject.iconMembers);
         emblem = new SymbolGuildEmblemGeneric(_nativeObject.emblem);
         iconLocale = new SymbolPlaceholderGeneric(_nativeObject.iconLocale);
      }
      
      public function setNativeInstance(param1:SymbolGuildSearchLine) : void
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
         FlashLabelArea.setNativeInstance(txtName,_nativeObject.txtName);
         FlashLabelArea.setNativeInstance(txtTotalPercentage,_nativeObject.txtTotalPercentage);
         FlashLabelArea.setNativeInstance(txtMembers,_nativeObject.txtMembers);
         if(_nativeObject.iconMembers)
         {
            iconMembers.setNativeInstance(_nativeObject.iconMembers);
         }
         if(_nativeObject.emblem)
         {
            emblem.setNativeInstance(_nativeObject.emblem);
         }
         if(_nativeObject.iconLocale)
         {
            iconLocale.setNativeInstance(_nativeObject.iconLocale);
         }
      }
   }
}
