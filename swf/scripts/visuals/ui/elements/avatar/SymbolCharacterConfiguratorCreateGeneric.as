package visuals.ui.elements.avatar
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowLeftGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightGeneric;
   import visuals.ui.elements.buttons.SymbolButtonGenderFemaleGeneric;
   import visuals.ui.elements.buttons.SymbolButtonGenderMaleGeneric;
   import visuals.ui.elements.generic.SymbolButtonRandomizeGeneric;
   import visuals.ui.elements.guild.SymbolColorBoxGeneric;
   import visuals.ui.elements.guild.SymbolColorBoxPickerGeneric;
   
   public class SymbolCharacterConfiguratorCreateGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCharacterConfiguratorCreate = null;
      
      public var bg:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnRandomize:SymbolButtonRandomizeGeneric = null;
      
      public var txtFacialHair:ILabel = null;
      
      public var btnRightFacialHair:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftFacialHair:SymbolButtonArrowLeftGeneric = null;
      
      public var colorBoxFacialHair:SymbolColorBoxGeneric = null;
      
      public var txtSkinColor:ILabel = null;
      
      public var btnRightSkinColor:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftSkinColor:SymbolButtonArrowLeftGeneric = null;
      
      public var txtMouth:ILabel = null;
      
      public var btnRightMouth:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftMouth:SymbolButtonArrowLeftGeneric = null;
      
      public var txtNose:ILabel = null;
      
      public var btnRightNose:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftNose:SymbolButtonArrowLeftGeneric = null;
      
      public var txtDecoration:ILabel = null;
      
      public var btnRightDecoration:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftDecoration:SymbolButtonArrowLeftGeneric = null;
      
      public var txtEyebrows:ILabel = null;
      
      public var btnRightEyebrows:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftEyebrows:SymbolButtonArrowLeftGeneric = null;
      
      public var colorBoxEyebrows:SymbolColorBoxGeneric = null;
      
      public var colorBoxPickerEyebrows:SymbolColorBoxPickerGeneric = null;
      
      public var txtEyes:ILabel = null;
      
      public var btnRightEyes:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftEyes:SymbolButtonArrowLeftGeneric = null;
      
      public var txtHair:ILabel = null;
      
      public var btnRightHair:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftHair:SymbolButtonArrowLeftGeneric = null;
      
      public var colorBoxHair:SymbolColorBoxGeneric = null;
      
      public var colorBoxPickerHair:SymbolColorBoxPickerGeneric = null;
      
      public var txtHead:ILabel = null;
      
      public var btnRightHead:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftHead:SymbolButtonArrowLeftGeneric = null;
      
      public var colorBoxPickerFacialHair:SymbolColorBoxPickerGeneric = null;
      
      public var btnGenderFemale:SymbolButtonGenderFemaleGeneric = null;
      
      public var btnGenderMale:SymbolButtonGenderMaleGeneric = null;
      
      public function SymbolCharacterConfiguratorCreateGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCharacterConfiguratorCreate;
         }
         else
         {
            _nativeObject = new SymbolCharacterConfiguratorCreate();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.bg);
         btnRandomize = new SymbolButtonRandomizeGeneric(_nativeObject.btnRandomize);
         txtFacialHair = FlashLabel.fromNative(_nativeObject.txtFacialHair);
         btnRightFacialHair = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightFacialHair);
         btnLeftFacialHair = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftFacialHair);
         colorBoxFacialHair = new SymbolColorBoxGeneric(_nativeObject.colorBoxFacialHair);
         txtSkinColor = FlashLabel.fromNative(_nativeObject.txtSkinColor);
         btnRightSkinColor = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightSkinColor);
         btnLeftSkinColor = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftSkinColor);
         txtMouth = FlashLabel.fromNative(_nativeObject.txtMouth);
         btnRightMouth = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightMouth);
         btnLeftMouth = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftMouth);
         txtNose = FlashLabel.fromNative(_nativeObject.txtNose);
         btnRightNose = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightNose);
         btnLeftNose = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftNose);
         txtDecoration = FlashLabel.fromNative(_nativeObject.txtDecoration);
         btnRightDecoration = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightDecoration);
         btnLeftDecoration = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftDecoration);
         txtEyebrows = FlashLabel.fromNative(_nativeObject.txtEyebrows);
         btnRightEyebrows = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightEyebrows);
         btnLeftEyebrows = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftEyebrows);
         colorBoxEyebrows = new SymbolColorBoxGeneric(_nativeObject.colorBoxEyebrows);
         colorBoxPickerEyebrows = new SymbolColorBoxPickerGeneric(_nativeObject.colorBoxPickerEyebrows);
         txtEyes = FlashLabel.fromNative(_nativeObject.txtEyes);
         btnRightEyes = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightEyes);
         btnLeftEyes = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftEyes);
         txtHair = FlashLabel.fromNative(_nativeObject.txtHair);
         btnRightHair = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightHair);
         btnLeftHair = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftHair);
         colorBoxHair = new SymbolColorBoxGeneric(_nativeObject.colorBoxHair);
         colorBoxPickerHair = new SymbolColorBoxPickerGeneric(_nativeObject.colorBoxPickerHair);
         txtHead = FlashLabel.fromNative(_nativeObject.txtHead);
         btnRightHead = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightHead);
         btnLeftHead = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftHead);
         colorBoxPickerFacialHair = new SymbolColorBoxPickerGeneric(_nativeObject.colorBoxPickerFacialHair);
         btnGenderFemale = new SymbolButtonGenderFemaleGeneric(_nativeObject.btnGenderFemale);
         btnGenderMale = new SymbolButtonGenderMaleGeneric(_nativeObject.btnGenderMale);
      }
      
      public function setNativeInstance(param1:SymbolCharacterConfiguratorCreate) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         if(_nativeObject.btnRandomize)
         {
            btnRandomize.setNativeInstance(_nativeObject.btnRandomize);
         }
         FlashLabel.setNativeInstance(txtFacialHair,_nativeObject.txtFacialHair);
         if(_nativeObject.btnRightFacialHair)
         {
            btnRightFacialHair.setNativeInstance(_nativeObject.btnRightFacialHair);
         }
         if(_nativeObject.btnLeftFacialHair)
         {
            btnLeftFacialHair.setNativeInstance(_nativeObject.btnLeftFacialHair);
         }
         if(_nativeObject.colorBoxFacialHair)
         {
            colorBoxFacialHair.setNativeInstance(_nativeObject.colorBoxFacialHair);
         }
         FlashLabel.setNativeInstance(txtSkinColor,_nativeObject.txtSkinColor);
         if(_nativeObject.btnRightSkinColor)
         {
            btnRightSkinColor.setNativeInstance(_nativeObject.btnRightSkinColor);
         }
         if(_nativeObject.btnLeftSkinColor)
         {
            btnLeftSkinColor.setNativeInstance(_nativeObject.btnLeftSkinColor);
         }
         FlashLabel.setNativeInstance(txtMouth,_nativeObject.txtMouth);
         if(_nativeObject.btnRightMouth)
         {
            btnRightMouth.setNativeInstance(_nativeObject.btnRightMouth);
         }
         if(_nativeObject.btnLeftMouth)
         {
            btnLeftMouth.setNativeInstance(_nativeObject.btnLeftMouth);
         }
         FlashLabel.setNativeInstance(txtNose,_nativeObject.txtNose);
         if(_nativeObject.btnRightNose)
         {
            btnRightNose.setNativeInstance(_nativeObject.btnRightNose);
         }
         if(_nativeObject.btnLeftNose)
         {
            btnLeftNose.setNativeInstance(_nativeObject.btnLeftNose);
         }
         FlashLabel.setNativeInstance(txtDecoration,_nativeObject.txtDecoration);
         if(_nativeObject.btnRightDecoration)
         {
            btnRightDecoration.setNativeInstance(_nativeObject.btnRightDecoration);
         }
         if(_nativeObject.btnLeftDecoration)
         {
            btnLeftDecoration.setNativeInstance(_nativeObject.btnLeftDecoration);
         }
         FlashLabel.setNativeInstance(txtEyebrows,_nativeObject.txtEyebrows);
         if(_nativeObject.btnRightEyebrows)
         {
            btnRightEyebrows.setNativeInstance(_nativeObject.btnRightEyebrows);
         }
         if(_nativeObject.btnLeftEyebrows)
         {
            btnLeftEyebrows.setNativeInstance(_nativeObject.btnLeftEyebrows);
         }
         if(_nativeObject.colorBoxEyebrows)
         {
            colorBoxEyebrows.setNativeInstance(_nativeObject.colorBoxEyebrows);
         }
         if(_nativeObject.colorBoxPickerEyebrows)
         {
            colorBoxPickerEyebrows.setNativeInstance(_nativeObject.colorBoxPickerEyebrows);
         }
         FlashLabel.setNativeInstance(txtEyes,_nativeObject.txtEyes);
         if(_nativeObject.btnRightEyes)
         {
            btnRightEyes.setNativeInstance(_nativeObject.btnRightEyes);
         }
         if(_nativeObject.btnLeftEyes)
         {
            btnLeftEyes.setNativeInstance(_nativeObject.btnLeftEyes);
         }
         FlashLabel.setNativeInstance(txtHair,_nativeObject.txtHair);
         if(_nativeObject.btnRightHair)
         {
            btnRightHair.setNativeInstance(_nativeObject.btnRightHair);
         }
         if(_nativeObject.btnLeftHair)
         {
            btnLeftHair.setNativeInstance(_nativeObject.btnLeftHair);
         }
         if(_nativeObject.colorBoxHair)
         {
            colorBoxHair.setNativeInstance(_nativeObject.colorBoxHair);
         }
         if(_nativeObject.colorBoxPickerHair)
         {
            colorBoxPickerHair.setNativeInstance(_nativeObject.colorBoxPickerHair);
         }
         FlashLabel.setNativeInstance(txtHead,_nativeObject.txtHead);
         if(_nativeObject.btnRightHead)
         {
            btnRightHead.setNativeInstance(_nativeObject.btnRightHead);
         }
         if(_nativeObject.btnLeftHead)
         {
            btnLeftHead.setNativeInstance(_nativeObject.btnLeftHead);
         }
         if(_nativeObject.colorBoxPickerFacialHair)
         {
            colorBoxPickerFacialHair.setNativeInstance(_nativeObject.colorBoxPickerFacialHair);
         }
         if(_nativeObject.btnGenderFemale)
         {
            btnGenderFemale.setNativeInstance(_nativeObject.btnGenderFemale);
         }
         if(_nativeObject.btnGenderMale)
         {
            btnGenderMale.setNativeInstance(_nativeObject.btnGenderMale);
         }
      }
   }
}
