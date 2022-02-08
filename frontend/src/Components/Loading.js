const Loading = ({modalRef}) => {
	return (
      <div id="myModal" class="modal" ref={modalRef}>
        <div class="modal-content">
          <div class="loading"/>
        </div>
      </div>
	)
}

export default Loading;
