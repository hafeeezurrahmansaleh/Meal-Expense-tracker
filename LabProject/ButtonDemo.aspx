<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ButtonDemo.aspx.cs" Inherits="LabProject.ButtonDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/classie.js"></script>
    <script src="Scripts/modernizr.custom.js"></script>
    <link href="CSS/default.css" rel="stylesheet" />
    <link href="CSS/component.css" rel="stylesheet" />
    
    
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        
        			<section class="color-7" id="btn-click">
				<p class="text">Click on the buttons to see the effect</p>
				<p>
					<button class="btn btn-7 btn-7a icon-truck">Order item</button>
					<button class="btn btn-7 btn-7b icon-envelope">Send message</button>
				</p>
				<p>
					<button class="btn btn-7 btn-7c btn-icon-only icon-arrow-right" >Submit</button>
					<button class="btn btn-7 btn-7d btn-icon-only icon-remove">Empty</button>
				</p>
				<p>
					<button class="btn btn-7 btn-7e btn-icon-only icon-heart">Like</button>
					<button class="btn btn-7 btn-7f btn-icon-only icon-star">Fav</button>
					<button class="btn btn-7 btn-7g btn-icon-only icon-plus">Add</button>
				</p></section>
    <section class="color-5">
				<p>
					<button class="btn btn-5 btn-5a icon-cart"><span>Add to cart</span></button>
					<button class="btn btn-5 btn-5a icon-remove"><span>Delete</span></button>
					<button class="btn btn-5 btn-5a icon-cog"><span>Settings</span></button>
				</p>
				<p>
					<button class="btn btn-5 btn-5b icon-cart"><span>Add to cart</span></button>
					<button class="btn btn-5 btn-5b icon-remove"><span>Delete</span></button>
					<button class="btn btn-5 btn-5b icon-cog"><span>Settings</span></button>
				</p>
			</section>
			<section class="color-6">
				<p>
					<button class="btn btn-6 btn-6a">Button</button>
					<button class="btn btn-6 btn-6b">Button</button>
					<button class="btn btn-6 btn-6c">Button</button>
				</p>
                </section>
    </div>
        <script src="Scripts/classie.js"></script>
        <script>
			var buttons7Click = Array.prototype.slice.call( document.querySelectorAll( '#btn-click button' ) ),
				buttons9Click = Array.prototype.slice.call( document.querySelectorAll( 'button.btn-8g' ) ),
				totalButtons7Click = buttons7Click.length,
				totalButtons9Click = buttons9Click.length;

			buttons7Click.forEach( function( el, i ) { el.addEventListener( 'click', activate, false ); } );
			buttons9Click.forEach( function( el, i ) { el.addEventListener( 'click', activate, false ); } );

			function activate() {
				var self = this, activatedClass = 'btn-activated';

				if( classie.has( this, 'btn-7h' ) ) {
					// if it is the first of the two btn-7h then activatedClass = 'btn-error';
					// if it is the second then activatedClass = 'btn-success'
					activatedClass = buttons7Click.indexOf( this ) === totalButtons7Click-2 ? 'btn-error' : 'btn-success';
				}
				else if( classie.has( this, 'btn-8g' ) ) {
					// if it is the first of the two btn-8g then activatedClass = 'btn-success3d';
					// if it is the second then activatedClass = 'btn-error3d'
					activatedClass = buttons9Click.indexOf( this ) === totalButtons9Click-2 ? 'btn-success3d' : 'btn-error3d';
				}

				if( !classie.has( this, activatedClass ) ) {
					classie.add( this, activatedClass );
					setTimeout( function() { classie.remove( self, activatedClass ) }, 1000 );
				}
			}

			document.querySelector( '.btn-7i' ).addEventListener( 'click', function() {
				classie.add( document.querySelector( '#trash-effect' ), 'trash-effect-active' );
			}, false );
		</script>
    </form>
</body>
</html>
