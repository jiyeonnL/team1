<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


    <nav
      class="navbar navbar-expand-sm navbar-dark bg-primary sticky-top"
      aria-label="Third navbar example"
    >
      <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarsExample03">
          <ul class="navbar-nav me-auto mb-2 mb-sm-0">
            <li class="nav-item">
              <select class="form-select" id="country">
                <option value="">Region</option>
                <option>지역</option>
                <option>지역</option>
                <option>지역</option>
              </select>
            </li>

            <li class="nav-item">
              <button type="button" class="btn btn-info ms-1">
                동네소식
              </button>
            </li>
            <li class="nav-item">
              <button type="button" class="btn btn-info ms-1">
                동네질문
              </button>
            </li>
            <li class="nav-item">
              <button type="button" class="btn btn-info ms-1">
                일상생활
              </button>
            </li>
            <li class="nav-item">
              <button type="button" class="btn btn-info ms-1">
                해주세요
              </button>
            </li>
          </ul>
          <form>
            <input
              class="form-control"
              type="text"
              placeholder="Search"
              aria-label="Search"
            />
          </form>
        </div>
      </div>
    </nav>