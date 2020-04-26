package starling.display
{
   import flash.geom.Rectangle;
   import starling.rendering.IndexData;
   import starling.rendering.VertexData;
   import starling.textures.Texture;
   import starling.utils.MathUtil;
   import starling.utils.Padding;
   import starling.utils.Pool;
   import starling.utils.RectangleUtil;
   
   public class Image extends Quad
   {
      
      private static var sPadding:Padding = new Padding();
      
      private static var sBounds:Rectangle = new Rectangle();
      
      private static var sBasCols:Vector.<Number> = new Vector.<Number>(3,true);
      
      private static var sBasRows:Vector.<Number> = new Vector.<Number>(3,true);
      
      private static var sPosCols:Vector.<Number> = new Vector.<Number>(3,true);
      
      private static var sPosRows:Vector.<Number> = new Vector.<Number>(3,true);
      
      private static var sTexCols:Vector.<Number> = new Vector.<Number>(3,true);
      
      private static var sTexRows:Vector.<Number> = new Vector.<Number>(3,true);
       
      
      private var _scale9Grid:Rectangle;
      
      private var _tileGrid:Rectangle;
      
      public function Image(param1:Texture)
      {
         super(100,100);
         this.texture = param1;
         readjustSize();
      }
      
      public function get scale9Grid() : Rectangle
      {
         return _scale9Grid;
      }
      
      public function set scale9Grid(param1:Rectangle) : void
      {
         if(param1)
         {
            if(_scale9Grid == null)
            {
               _scale9Grid = param1.clone();
            }
            else
            {
               _scale9Grid.copyFrom(param1);
            }
            readjustSize();
            _tileGrid = null;
         }
         else
         {
            _scale9Grid = null;
         }
         setupVertices();
      }
      
      public function get tileGrid() : Rectangle
      {
         return _tileGrid;
      }
      
      public function set tileGrid(param1:Rectangle) : void
      {
         if(param1)
         {
            if(_tileGrid == null)
            {
               _tileGrid = param1.clone();
            }
            else
            {
               _tileGrid.copyFrom(param1);
            }
            _scale9Grid = null;
         }
         else
         {
            _tileGrid = null;
         }
         setupVertices();
      }
      
      override protected function setupVertices() : void
      {
         if(texture && _scale9Grid)
         {
            setupScale9Grid();
         }
         else if(texture && _tileGrid)
         {
            setupTileGrid();
         }
         else
         {
            super.setupVertices();
         }
      }
      
      override public function set scaleX(param1:Number) : void
      {
         .super.scaleX = param1;
         if(texture && (_scale9Grid || _tileGrid))
         {
            setupVertices();
         }
      }
      
      override public function set scaleY(param1:Number) : void
      {
         .super.scaleY = param1;
         if(texture && (_scale9Grid || _tileGrid))
         {
            setupVertices();
         }
      }
      
      override public function set texture(param1:Texture) : void
      {
         if(param1 != texture)
         {
            .super.texture = param1;
            if(_scale9Grid && param1)
            {
               readjustSize();
            }
         }
      }
      
      private function setupScale9Grid() : void
      {
         var _loc1_:int = 0;
         var _loc10_:int = 0;
         var _loc18_:Number = NaN;
         var _loc6_:int = 0;
         var _loc3_:* = 0;
         var _loc17_:Number = NaN;
         var _loc4_:Texture = this.texture;
         var _loc19_:Rectangle = _loc4_.frame;
         var _loc9_:Number = scaleX > 0?scaleX:Number(-scaleX);
         var _loc11_:Number = scaleY > 0?scaleY:Number(-scaleY);
         if(MathUtil.isEquivalent(_scale9Grid.width,_loc4_.frameWidth))
         {
            _loc11_ = _loc11_ / _loc9_;
         }
         else if(MathUtil.isEquivalent(_scale9Grid.height,_loc4_.frameHeight))
         {
            _loc9_ = _loc9_ / _loc11_;
         }
         var _loc7_:Number = 1 / _loc9_;
         var _loc13_:Number = 1 / _loc11_;
         var _loc5_:VertexData = this.vertexData;
         var _loc8_:IndexData = this.indexData;
         var _loc2_:int = _loc5_.numVertices;
         var _loc12_:Rectangle = Pool.getRectangle();
         var _loc14_:Rectangle = Pool.getRectangle();
         var _loc15_:Rectangle = Pool.getRectangle();
         var _loc16_:Rectangle = Pool.getRectangle();
         _loc12_.copyFrom(_scale9Grid);
         _loc14_.setTo(0,0,_loc4_.frameWidth,_loc4_.frameHeight);
         if(_loc19_)
         {
            _loc15_.setTo(-_loc19_.x,-_loc19_.y,_loc4_.width,_loc4_.height);
         }
         else
         {
            _loc15_.copyFrom(_loc14_);
         }
         RectangleUtil.intersect(_loc12_,_loc15_,_loc16_);
         var _loc20_:* = 0;
         sBasCols[2] = _loc20_;
         sBasCols[0] = _loc20_;
         _loc20_ = 0;
         sBasRows[2] = _loc20_;
         sBasRows[0] = _loc20_;
         sBasCols[1] = _loc16_.width;
         sBasRows[1] = _loc16_.height;
         if(_loc15_.x < _loc12_.x)
         {
            sBasCols[0] = _loc12_.x - _loc15_.x;
         }
         if(_loc15_.y < _loc12_.y)
         {
            sBasRows[0] = _loc12_.y - _loc15_.y;
         }
         if(_loc15_.right > _loc12_.right)
         {
            sBasCols[2] = _loc15_.right - _loc12_.right;
         }
         if(_loc15_.bottom > _loc12_.bottom)
         {
            sBasRows[2] = _loc15_.bottom - _loc12_.bottom;
         }
         if(_loc15_.x < _loc12_.x)
         {
            sPadding.left = _loc15_.x * _loc7_;
         }
         else
         {
            sPadding.left = _loc12_.x * _loc7_ + _loc15_.x - _loc12_.x;
         }
         if(_loc15_.right > _loc12_.right)
         {
            sPadding.right = (_loc14_.width - _loc15_.right) * _loc7_;
         }
         else
         {
            sPadding.right = (_loc14_.width - _loc12_.right) * _loc7_ + _loc12_.right - _loc15_.right;
         }
         if(_loc15_.y < _loc12_.y)
         {
            sPadding.top = _loc15_.y * _loc13_;
         }
         else
         {
            sPadding.top = _loc12_.y * _loc13_ + _loc15_.y - _loc12_.y;
         }
         if(_loc15_.bottom > _loc12_.bottom)
         {
            sPadding.bottom = (_loc14_.height - _loc15_.bottom) * _loc13_;
         }
         else
         {
            sPadding.bottom = (_loc14_.height - _loc12_.bottom) * _loc13_ + _loc12_.bottom - _loc15_.bottom;
         }
         sPosCols[0] = sBasCols[0] * _loc7_;
         sPosCols[2] = sBasCols[2] * _loc7_;
         sPosCols[1] = _loc14_.width - sPadding.left - sPadding.right - sPosCols[0] - sPosCols[2];
         sPosRows[0] = sBasRows[0] * _loc13_;
         sPosRows[2] = sBasRows[2] * _loc13_;
         sPosRows[1] = _loc14_.height - sPadding.top - sPadding.bottom - sPosRows[0] - sPosRows[2];
         if(sPosCols[1] <= 0)
         {
            _loc18_ = _loc14_.width / (_loc14_.width - _loc12_.width) * _loc9_;
            sPadding.left = sPadding.left * _loc18_;
            _loc20_ = 0;
            var _loc21_:* = sPosCols[_loc20_] * _loc18_;
            sPosCols[_loc20_] = _loc21_;
            sPosCols[1] = 0;
            _loc21_ = 2;
            _loc20_ = sPosCols[_loc21_] * _loc18_;
            sPosCols[_loc21_] = _loc20_;
         }
         if(sPosRows[1] <= 0)
         {
            _loc18_ = _loc14_.height / (_loc14_.height - _loc12_.height) * _loc11_;
            sPadding.top = sPadding.top * _loc18_;
            _loc20_ = 0;
            _loc21_ = sPosRows[_loc20_] * _loc18_;
            sPosRows[_loc20_] = _loc21_;
            sPosRows[1] = 0;
            _loc21_ = 2;
            _loc20_ = sPosRows[_loc21_] * _loc18_;
            sPosRows[_loc21_] = _loc20_;
         }
         sTexCols[0] = sBasCols[0] / _loc15_.width;
         sTexCols[2] = sBasCols[2] / _loc15_.width;
         sTexCols[1] = 1 - sTexCols[0] - sTexCols[2];
         sTexRows[0] = sBasRows[0] / _loc15_.height;
         sTexRows[2] = sBasRows[2] / _loc15_.height;
         sTexRows[1] = 1 - sTexRows[0] - sTexRows[2];
         _loc10_ = setupScale9GridAttributes(sPadding.left,sPadding.top,sPosCols,sPosRows,sTexCols,sTexRows);
         _loc1_ = _loc10_ / 4;
         _loc5_.numVertices = _loc10_;
         _loc8_.numIndices = 0;
         _loc6_ = 0;
         while(_loc6_ < _loc1_)
         {
            _loc8_.addQuad(_loc6_ * 4,_loc6_ * 4 + 1,_loc6_ * 4 + 2,_loc6_ * 4 + 3);
            _loc6_++;
         }
         if(_loc10_ != _loc2_)
         {
            _loc3_ = uint(!!_loc2_?_loc5_.getColor(0):16777215);
            _loc17_ = !!_loc2_?_loc5_.getAlpha(0):1;
            _loc5_.colorize("color",_loc3_,_loc17_);
         }
         Pool.putRectangle(_loc14_);
         Pool.putRectangle(_loc15_);
         Pool.putRectangle(_loc12_);
         Pool.putRectangle(_loc16_);
         setRequiresRedraw();
      }
      
      private function setupScale9GridAttributes(param1:Number, param2:Number, param3:Vector.<Number>, param4:Vector.<Number>, param5:Vector.<Number>, param6:Vector.<Number>) : int
      {
         var _loc13_:* = null;
         _loc13_ = "position";
         var _loc21_:* = null;
         _loc21_ = "texCoords";
         var _loc7_:int = 0;
         var _loc20_:int = 0;
         var _loc12_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc10_:VertexData = this.vertexData;
         var _loc9_:Texture = this.texture;
         var _loc14_:* = param1;
         var _loc11_:* = param2;
         var _loc17_:* = 0;
         var _loc16_:* = 0;
         var _loc8_:int = 0;
         _loc20_ = 0;
         while(_loc20_ < 3)
         {
            _loc12_ = param4[_loc20_];
            _loc18_ = param6[_loc20_];
            if(_loc12_ > 0)
            {
               _loc7_ = 0;
               while(_loc7_ < 3)
               {
                  _loc19_ = param3[_loc7_];
                  _loc15_ = param5[_loc7_];
                  if(_loc19_ > 0)
                  {
                     _loc10_.setPoint(_loc8_,"position",_loc14_,_loc11_);
                     _loc9_.setTexCoords(_loc10_,_loc8_,"texCoords",_loc17_,_loc16_);
                     _loc8_++;
                     _loc10_.setPoint(_loc8_,"position",_loc14_ + _loc19_,_loc11_);
                     _loc9_.setTexCoords(_loc10_,_loc8_,"texCoords",_loc17_ + _loc15_,_loc16_);
                     _loc8_++;
                     _loc10_.setPoint(_loc8_,"position",_loc14_,_loc11_ + _loc12_);
                     _loc9_.setTexCoords(_loc10_,_loc8_,"texCoords",_loc17_,_loc16_ + _loc18_);
                     _loc8_++;
                     _loc10_.setPoint(_loc8_,"position",_loc14_ + _loc19_,_loc11_ + _loc12_);
                     _loc9_.setTexCoords(_loc10_,_loc8_,"texCoords",_loc17_ + _loc15_,_loc16_ + _loc18_);
                     _loc8_++;
                     _loc14_ = Number(_loc14_ + _loc19_);
                  }
                  _loc17_ = Number(_loc17_ + _loc15_);
                  _loc7_++;
               }
               _loc11_ = Number(_loc11_ + _loc12_);
            }
            _loc14_ = param1;
            _loc17_ = 0;
            _loc16_ = Number(_loc16_ + _loc18_);
            _loc20_++;
         }
         return _loc8_;
      }
      
      private function setupTileGrid() : void
      {
         var _loc12_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc27_:* = NaN;
         var _loc21_:* = 0;
         var _loc17_:Texture = this.texture;
         var _loc32_:Rectangle = _loc17_.frame;
         var _loc20_:VertexData = this.vertexData;
         var _loc4_:IndexData = this.indexData;
         var _loc28_:Rectangle = getBounds(this,sBounds);
         var _loc13_:int = _loc20_.numVertices;
         var _loc1_:uint = !!_loc13_?_loc20_.getColor(0):16777215;
         var _loc9_:Number = !!_loc13_?_loc20_.getAlpha(0):1;
         var _loc22_:Number = scaleX > 0?1 / scaleX:Number(-1 / scaleX);
         var _loc8_:Number = scaleY > 0?1 / scaleY:Number(-1 / scaleY);
         var _loc26_:Number = _tileGrid.width > 0?_tileGrid.width:Number(_loc17_.frameWidth);
         var _loc11_:Number = _tileGrid.height > 0?_tileGrid.height:Number(_loc17_.frameHeight);
         _loc26_ = _loc26_ * _loc22_;
         _loc11_ = _loc11_ * _loc8_;
         var _loc31_:Number = !!_loc32_?-_loc32_.x * (_loc26_ / _loc32_.width):0;
         var _loc33_:Number = !!_loc32_?-_loc32_.y * (_loc11_ / _loc32_.height):0;
         var _loc23_:Number = _loc17_.width * (_loc26_ / _loc17_.frameWidth);
         var _loc34_:Number = _loc17_.height * (_loc11_ / _loc17_.frameHeight);
         var _loc15_:Number = _tileGrid.x * _loc22_ % _loc26_;
         var _loc14_:Number = _tileGrid.y * _loc8_ % _loc11_;
         if(_loc15_ < 0)
         {
            _loc15_ = _loc15_ + _loc26_;
         }
         if(_loc14_ < 0)
         {
            _loc14_ = _loc14_ + _loc11_;
         }
         var _loc30_:Number = _loc15_ + _loc31_;
         var _loc29_:Number = _loc14_ + _loc33_;
         if(_loc30_ > _loc26_ - _loc23_)
         {
            _loc30_ = _loc30_ - _loc26_;
         }
         if(_loc29_ > _loc11_ - _loc34_)
         {
            _loc29_ = _loc29_ - _loc11_;
         }
         var _loc6_:String = "position";
         var _loc19_:String = "texCoords";
         var _loc5_:* = _loc29_;
         var _loc3_:int = 0;
         _loc4_.numIndices = 0;
         while(_loc5_ < _loc28_.height)
         {
            _loc27_ = _loc30_;
            while(_loc27_ < _loc28_.width)
            {
               _loc4_.addQuad(_loc3_,_loc3_ + 1,_loc3_ + 2,_loc3_ + 3);
               _loc18_ = _loc27_ < 0?0:Number(_loc27_);
               _loc7_ = _loc5_ < 0?0:Number(_loc5_);
               _loc12_ = _loc27_ + _loc23_ > _loc28_.width?_loc28_.width:Number(_loc27_ + _loc23_);
               _loc24_ = _loc5_ + _loc34_ > _loc28_.height?_loc28_.height:Number(_loc5_ + _loc34_);
               _loc20_.setPoint(_loc3_,_loc6_,_loc18_,_loc7_);
               _loc20_.setPoint(_loc3_ + 1,_loc6_,_loc12_,_loc7_);
               _loc20_.setPoint(_loc3_ + 2,_loc6_,_loc18_,_loc24_);
               _loc20_.setPoint(_loc3_ + 3,_loc6_,_loc12_,_loc24_);
               _loc16_ = (_loc18_ - _loc27_) / _loc23_;
               _loc10_ = (_loc7_ - _loc5_) / _loc34_;
               _loc25_ = (_loc12_ - _loc27_) / _loc23_;
               _loc2_ = (_loc24_ - _loc5_) / _loc34_;
               _loc17_.setTexCoords(_loc20_,_loc3_,_loc19_,_loc16_,_loc10_);
               _loc17_.setTexCoords(_loc20_,_loc3_ + 1,_loc19_,_loc25_,_loc10_);
               _loc17_.setTexCoords(_loc20_,_loc3_ + 2,_loc19_,_loc16_,_loc2_);
               _loc17_.setTexCoords(_loc20_,_loc3_ + 3,_loc19_,_loc25_,_loc2_);
               _loc27_ = Number(_loc27_ + _loc26_);
               _loc3_ = _loc3_ + 4;
            }
            _loc5_ = Number(_loc5_ + _loc11_);
         }
         _loc20_.numVertices = _loc3_;
         _loc21_ = _loc13_;
         while(_loc21_ < _loc3_)
         {
            _loc20_.setColor(_loc21_,"color",_loc1_);
            _loc20_.setAlpha(_loc21_,"color",_loc9_);
            _loc21_++;
         }
         setRequiresRedraw();
      }
   }
}
